class AddCompanyMetadataToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :metadata, :text
  end
end
