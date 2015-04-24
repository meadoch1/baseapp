class CreateStreetAddresses < ActiveRecord::Migration
  def change
    create_table :street_addresses do |t|
      t.integer :address_type_id
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip_code
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6

      t.timestamps
    end
  end
end
