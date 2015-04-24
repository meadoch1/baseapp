class Person < ActiveRecord::Base
  belongs_to :street_address
  has_many :users
end
