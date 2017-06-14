class Review < ActiveRecord::Base
  belongs_to :company
  has_many :review_votes, dependent: :destroy
  attr_accessible :body, :email, :title, :company

  after_save :update_company_popularity

  def anonymize_email
    email.sub(/.*@/, "*****@")
  end

  private
  def update_company_popularity
    company.update_popularity
  end
end
