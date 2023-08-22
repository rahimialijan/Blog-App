class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author_id, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :text
      #t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      #t.datetime :updated_at, default: -> { 'CURRENT_TIMESTAMP' }, on_update: -> { 'CURRENT_TIMESTAMP' }
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
