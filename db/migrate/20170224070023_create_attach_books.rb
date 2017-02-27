class CreateAttachBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :attach_books do |t|
      t.datetime :publish_date
      t.integer :number_page
      t.datetime :limit_date
      t.text :description
      t.references :book

      t.timestamps null: false
    end
    add_index :attach_books, [:book_id, :created_at]
  end
end
