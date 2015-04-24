class Facility < ActiveRecord::Base
  belongs_to :facility_type
  belongs_to :street_address
  has_many :clients
end
