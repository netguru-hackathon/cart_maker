json.array!(@cities) do |city|
  json.extract! city, :id, :region_name
  json.url city_url(city, format: :json)
end
