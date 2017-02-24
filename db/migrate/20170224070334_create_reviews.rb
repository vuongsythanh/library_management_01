class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.text :content
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
