class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :person_id
      t.integer :facility_id
      t.string :facility_identifier
      t.date :release_date

      t.timestamps
    end
  end
end
