class RenamePostCounterToPostsCounterInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :post_counter, :posts_counter
  end
end
