cities = %w(wroclaw poznan krakow warszawa gdansk)

cities.each do |c|
  City.create(
    region_name: c
  )
end
