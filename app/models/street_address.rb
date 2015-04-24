class StreetAddress < ActiveRecord::Base
  belongs_to :address_type
  has_many :facilities
  has_many :persons
end
