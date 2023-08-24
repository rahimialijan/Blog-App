class RemoveColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :created_at, :datetime
  end
end
