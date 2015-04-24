class AddressType < ActiveRecord::Base
  has_many :street_addresses
end
