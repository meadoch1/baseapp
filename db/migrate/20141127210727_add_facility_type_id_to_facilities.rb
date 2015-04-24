class AddFacilityTypeIdToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :facility_type_id, :integer
  end
end
