class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :action_type
      t.integer :activity_type
      t.references :user

      t.timestamps
    end
  end
end
