class AddContactDtToClient < ActiveRecord::Migration
  def change
    add_column :clients, :contact_date, :date
  end
end
