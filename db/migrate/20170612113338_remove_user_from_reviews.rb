class RemoveUserFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :user_id
  end

  def down
  end
end
