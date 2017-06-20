require 'clearbit'

class Review < ActiveRecord::Base
  belongs_to :company
  has_many :review_votes, dependent: :destroy
  attr_accessible :body, :email, :title, :company, :score
  validates :score, inclusion: { in: (0..5), message: "Review score can be 0..5" }

  Clearbit.key = 'sk_18187bebada1d2e206108fa7ff5983c7'

  after_save :update_company_popularity
  before_create :create_company_if_none

  def anonymize_email
    email.sub(/.*@/, "*****@")
  end

  private
  def update_company_popularity
    company.update_popularity
  end

  def create_company_if_none
    # First search for existing company by domain
    company = Company.where('lower(domain) = ?', email.split("@").last.downcase).first
    if !company
      begin
        response = Clearbit::Enrichment.find(email: email, stream: true)
        c = response.company
      rescue => e
        c = {
          name: email.split("@").last,
          description: "No description could be found",
          domain: email.split("@").last,
          metadata: nil
        }
      end

      # Try again by name as returned from Clearbit API call
      company = Company.where('lower(name) = ?', c[:name].downcase).first
      # Finally, create
      self.company = company || Company.create!(
        name: c[:name],
        description: c[:description],
        domain: c[:domain],
        metadata: c
      )
    end
  end
end
