class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :level
      t.text :description
      t.integer :order_nr
      t.integer :curriculum_id

      t.timestamps
    end

    add_index :courses, :curriculum_id
  end
end
