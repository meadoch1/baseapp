class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :customer, index: true
      t.boolean :is_active

      t.timestamps null: false
    end
    add_foreign_key :projects, :customers
  end
end
