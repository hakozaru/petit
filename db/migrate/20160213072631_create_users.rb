class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 20, index: true, unique: true
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
