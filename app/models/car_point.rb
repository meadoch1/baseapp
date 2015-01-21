class CarPoint < ActiveRecord::Base
  validates :year, numericality: { only_integer: true, greater_than: 1900, less_than: Date.today.year + 1 }
  validates_presence_of :year, :make, :model

  def to_csv(options={})
    CSV.generate do |csv|
      csv << column_names
      all.each do |point|
        csv << point.attributes.values_at(*column_names)
      end
    end
  end
end
