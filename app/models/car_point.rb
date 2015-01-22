class CarPoint < ActiveRecord::Base
  validates :year, numericality: { only_integer: true, greater_than: 1900, less_than: Date.today.year + 1 }
  validates_presence_of :year, :make, :model
end
