class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :reviews
  has_many :company_votes
end
