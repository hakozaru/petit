class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :name
      t.text :tfield
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
