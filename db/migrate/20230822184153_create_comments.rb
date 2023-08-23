class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author_id, null: false,  foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true
      t.text :text
      t.datetime :create_at,  default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :update_at,  default: -> { 'CURRENT_TIMESTAMP' }, on_update: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
