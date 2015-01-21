class CarsetImportService

  def self.process(file)
    rejected_rows = []
    CarPoint.delete_all
    csv = CSV.new(file, headers: false)
    csv.each do |row|
      car = CarPoint.new(year: row[0], make: clean(row[1]), model: clean(row[2]))
      if car.valid?
        car.save
      else
        rejected_rows << row
      end
    end
    if rejected_rows.empty?
      {success: true}
    else
      {success: false, rejected_rows: rejected_rows}
    end
  end

  def self.clean(string)
    string.strip.gsub(/\A'/, '').gsub(/'\Z/,'')
  end
end
