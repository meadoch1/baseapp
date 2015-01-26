class CarSearch
  extend Forwardable

  def_delegators :@points, :map, :each, :size, :empty?, :first, :join
  attr_reader :points

  def initialize(points)
    @points = points
  end

  def self.find(year, make, model)
    table = CarPoint
    table = table.where(year: year) unless year.blank?
    table = table.where("make like :make", make: "#{make}%") unless make.blank?
    table = table.where("model like :model", model: "#{model}%") unless model.blank?
    new(table.all)
  end

  def to_json(options={})
    {results: @points}.to_json
  end

end
