class RemoveRoleColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :string, default:'admin'
  end
end
