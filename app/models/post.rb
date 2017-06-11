class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  attr_accessible :body
end
