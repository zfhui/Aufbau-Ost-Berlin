json.array!(@literatures) do |literature|
  json.extract! literature, :id, :author, :title, :subtitle, :published_at, :publisher, :year, :cover_file, :url
  json.url literature_url(literature, format: :json)
end
