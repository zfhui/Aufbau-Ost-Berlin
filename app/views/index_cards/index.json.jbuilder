json.array!(@index_cards) do |index_card|
  json.extract! index_card, :id, :photographer, :architect, :building_name, :place, :systematic, :filename, :no_of_photos, :inventory_date, :creditline, :content, :year_taken, :original_filename, :flickr_id, :url_t, :url_s, :url_sq, :url_m, :url_o, :pathalias, :title
  json.url index_card_url(index_card, format: :json)
end
