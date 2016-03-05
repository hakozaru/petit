class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 100
      t.string :name
      t.text :tfield, null: false, limit: 10000
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
