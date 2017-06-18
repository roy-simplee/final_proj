require 'clearbit'

class Review < ActiveRecord::Base
  belongs_to :company
  has_many :review_votes, dependent: :destroy
  attr_accessible :body, :email, :title, :company, :score
  validates :score, inclusion: { in: (0..5), message: "Review score can be 0..5" }

  Clearbit.key = 'sk_18187bebada1d2e206108fa7ff5983c7'

  after_save :update_company_popularity
  after_create :anonymize_email
  before_create :create_company_if_none

  def anonymize_email
    email.sub!(/.*@/, "*****@")
  end

  private
  def update_company_popularity
    company.update_popularity
  end

  def create_company_if_none
    company = Company.where('lower(domain) = ?', email.sub(/.*@(.*)/, "\\1").downcase).first
    if !company
      begin
        response = Clearbit::Enrichment.find(email: email, stream: true)
        c = response.company || {
          name: email.sub(/.*@(.*)/, "\\1"),
          description: "No description could be found"
        }

        company = Company.where('lower(name) = ?', c.name.downcase).first
        Company.create!(
          name: c.name,
          description: c.description,
          metadata: c
        ) if !company
      rescue => e
        nil
      end
    end
  end
end
