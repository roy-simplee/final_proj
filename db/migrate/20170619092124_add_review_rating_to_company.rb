class AddReviewRatingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :review_rating, :integer
  end
end
