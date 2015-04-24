class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :description
      t.integer :notification_type_id
      t.integer :order_nr
      t.integer :curriculum_id

      t.timestamps
    end

    add_index :notifications, :curriculum_id
  end
end
