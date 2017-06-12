class CreateCompanyVotes < ActiveRecord::Migration
  def change
    create_table :company_votes do |t|
      t.integer :vote
      t.references :company

      t.timestamps
    end
    add_index :company_votes, :company_id
  end
end
