class CreateCarPoints < ActiveRecord::Migration
  def change
    create_table :car_points do |t|
      t.string :year
      t.string :make
      t.string :model

      t.timestamps null: false
    end
  end
end
