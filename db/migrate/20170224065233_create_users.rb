class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :address
      t.string :phone
      t.string :avatar
      t.boolean :is_admin
      t.boolean :remember_digest

      t.timestamps
    end
    add_index :users, [:email, :phone], unique: true
  end
end
