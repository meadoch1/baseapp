class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.boolean :booklet
      t.integer :order_nr
      t.integer :course_id

      t.timestamps
    end

    add_index :lessons, :course_id
  end
end
