class AddControversyToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :controversy, :float
  end
end
