class AddDomainToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :domain, :string
  end
end
