class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
