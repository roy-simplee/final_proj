class ChangeRatingToUserRating < ActiveRecord::Migration
  def change
    rename_column :companies, :rating, :user_rating
  end
end
