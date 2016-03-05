class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, limit: 50
      t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
