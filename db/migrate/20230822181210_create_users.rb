class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.datetime :create_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :update_at, default: -> {'CURRENT_TIMESTAMP'}, on_update: -> { 'CURRENT_TIMESTAMP' }
      t.integer :post_counter
      t.timestamps
    end
  end
end
