class AddRatingToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :rating, :integer
  end
end
