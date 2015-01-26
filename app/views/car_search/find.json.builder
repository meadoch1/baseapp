json.array!(@result.points) do |car_point|
  json.extract! car_point, :id, :year, :make, :model
  json.url car_point_url(car_point, format: :json)
end
