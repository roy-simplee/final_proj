class Company < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :reviews, dependent: :destroy
  has_many :company_votes, dependent: :destroy

  def update_popularity
    number_of_reviews = reviews.count
    update_attribute(:number_of_reviews, number_of_reviews)
  end

  def update_rating
    rating = upvotes - downvotes
    update_attribute(:rating, rating)
  end

  def update_controversy
    total_votes = upvotes + downvotes
    controversy = total_votes == 0 ?
      0 :
      1 - ((upvotes - downvotes).abs.to_f / (total_votes))
    update_attribute(:controversy, controversy)
  end

  def upvotes
    company_votes.where(vote: 1).count
  end

  def downvotes
    company_votes.where(vote: -1).count
  end
end
