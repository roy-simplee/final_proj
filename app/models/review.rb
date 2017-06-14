class Review < ActiveRecord::Base
  belongs_to :company
  has_many :review_votes, dependent: :destroy
  attr_accessible :body, :email, :title, :company, :score
  validates :score, inclusion: { in: (0..5), message: "Review score can be 1..5" }

  after_save :update_company_popularity

  def anonymize_email
    email.sub(/.*@/, "*****@")
  end

  private
  def update_company_popularity
    company.update_popularity
  end
end
