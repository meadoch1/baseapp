json.set! :results do
  json.array!(@result.clients) do |client|
    json.extract! client, :id, :first_name, :last_name, :city, :state, :facility_name
    json.url client_url(client, format: :json)
  end
end
