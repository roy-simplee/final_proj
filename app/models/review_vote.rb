class ReviewVote < ActiveRecord::Base
  belongs_to :review
  attr_accessible :vote, :review

  validates :vote, inclusion: { in: [-1, 1], message: "%{vote} is not a valid vote." }
end
