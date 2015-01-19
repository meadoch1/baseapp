class CreateCarsets < ActiveRecord::Migration
  def change
    create_table :carsets do |t|
      t.string :name
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :carsets, :users
    add_attachment :carsets, :file
  end
end
