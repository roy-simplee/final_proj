class CreateReviewVotes < ActiveRecord::Migration
  def change
    create_table :review_votes do |t|
      t.integer :vote
      t.references :review

      t.timestamps
    end
    add_index :review_votes, :review_id
  end
end
