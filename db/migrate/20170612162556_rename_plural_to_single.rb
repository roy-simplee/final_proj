class RenamePluralToSingle < ActiveRecord::Migration
  def change
    rename_table :review_votes, :review_vote
    rename_table :company_votes, :company_vote
  end
end
