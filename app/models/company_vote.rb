class CompanyVote < ActiveRecord::Base
  belongs_to :company
  attr_accessible :vote, :company

  validates :vote, inclusion: { in: [-1, 1], message: "%{vote} is not a valid vote." }
end
