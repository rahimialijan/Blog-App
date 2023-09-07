class UpdateForeignKeyConstraintOnComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :posts # If you previously added a constraint
    add_foreign_key :comments, :posts, on_delete: :cascade, name: 'fk_rails_comments_posts_cascade'
  end
end
