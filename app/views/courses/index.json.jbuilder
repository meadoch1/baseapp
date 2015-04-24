json.array!(@courses) do |course|
  json.extract! course, :id, :name, :level, :description, :order_nr, :curriculum_id
  json.url course_url(course, format: :json)
end
