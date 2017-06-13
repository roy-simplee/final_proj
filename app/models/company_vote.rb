class CompanyVote < ActiveRecord::Base
  belongs_to :company
  attr_accessible :vote, :company

  validates :vote, inclusion: { in: [-1, 1], message: "%{vote} is not a valid vote." }
  after_save :update_company_rating
  after_save :update_company_controversy

  private
  def update_company_rating
    company.update_rating
  end

  def update_company_controversy
    company.update_controversy
  end
end
