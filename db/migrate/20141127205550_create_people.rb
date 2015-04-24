class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :street_address_id
      t.string :phone
      t.string :mobile_phone

      t.timestamps
    end
  end
end
