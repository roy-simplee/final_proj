class Review < ActiveRecord::Base
  belongs_to :company
  has_many :review_votes
  attr_accessible :body, :email, :title, :company
end
