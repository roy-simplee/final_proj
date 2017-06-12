class Review < ActiveRecord::Base
  belongs_to :company
  attr_accessible :body, :email
end
