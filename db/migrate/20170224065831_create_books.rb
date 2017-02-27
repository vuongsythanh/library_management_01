class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.string :image
      t.references :category
      t.references :publisher
      t.references :author

      t.timestamps null: false
    end
    add_index :books, [:category_id, :created_at]
    add_index :books, [:publisher_id, :created_at]
    add_index :books, [:author_id, :created_at]
  end
end
