class ChangeReviewEmailToText < ActiveRecord::Migration
  def up
    change_column :reviews, :email, :text
  end

  def down
  end
end
