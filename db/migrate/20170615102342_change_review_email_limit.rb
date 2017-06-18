class ChangeReviewEmailLimit < ActiveRecord::Migration
  def up
    change_column :reviews, :email, :text, :limit => nil
  end

  def down
  end
end
