class DropVotes < ActiveRecord::Migration
  def up
    drop_table :review_vote
    drop_table :company_vote
  end

  def down
  end
end
