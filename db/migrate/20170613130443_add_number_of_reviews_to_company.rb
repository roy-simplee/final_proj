class AddNumberOfReviewsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :number_of_reviews, :integer
  end
end
