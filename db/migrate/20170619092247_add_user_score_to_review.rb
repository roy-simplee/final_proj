class AddUserScoreToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :user_score, :integer
  end
end
