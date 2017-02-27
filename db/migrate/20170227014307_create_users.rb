class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.boolean :is_admin
      t.boolean :remember_pass
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
