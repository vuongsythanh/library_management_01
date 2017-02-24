class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.datetime :start_day
      t.datetime :end_day
      t.text :content
      t.boolean :status
      t.references :user
      t.references :book

      t.timestamps null: false
    end
  end
end
