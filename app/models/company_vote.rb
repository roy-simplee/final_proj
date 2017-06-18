class CompanyVote < ActiveRecord::Base
  belongs_to :company
  attr_accessible :vote, :company

  validates :vote, inclusion: { in: [-1, 1], message: "%{vote} is not a valid vote." }
  after_save :update_company_rating_and_controversy

  private
  def update_company_rating_and_controversy
    company.update_rating_and_controversy
  end
end
