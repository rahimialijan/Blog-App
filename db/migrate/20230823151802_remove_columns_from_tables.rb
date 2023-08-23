class RemoveColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :create_at, :datetime
    remove_column :users, :update_at, :datetime
    remove_column :comments, :create_at, :datetime
    remove_column :comments, :update_at, :datetime
    remove_column :likes, :create_at, :datetime
    remove_column :likes, :update_at, :datetime
  end
end
