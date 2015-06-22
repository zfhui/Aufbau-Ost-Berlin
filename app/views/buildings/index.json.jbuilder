json.array!(@buildings) do |building|
  json.extract! building, :id
  json.url building_url(building, format: :json)
end
