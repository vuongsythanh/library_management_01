class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
