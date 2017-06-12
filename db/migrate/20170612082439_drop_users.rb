class DropUsers < ActiveRecord::Migration
  def up
    # drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigrationn
  end
end
