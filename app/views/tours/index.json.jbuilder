json.array!(@tours) do |tour|
  json.extract! tour, :id, :name
  json.url tour_url(tour, format: :json)
end
