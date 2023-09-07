class UpdateForeignKeyConstraintOnLikes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :likes, :posts # If you previously added a constraint
    add_foreign_key :likes, :posts, on_delete: :cascade, name: 'fk_rails_likes_posts_cascade'
  end
end
