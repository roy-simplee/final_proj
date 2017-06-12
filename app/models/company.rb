class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :reviews, dependent: :destroy
  has_many :company_votes, dependent: :destroy
end
