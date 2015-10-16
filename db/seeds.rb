cities = %w(wroclaw poznan krakow warszawa gdansk)

cities.each do |c|
  City.create(
    region_name: c
  )
end

unless user = User.find_by_email('admin@admin.admin')
  User.create!(
    email: 'admin@admin.admin',
    password: 'asdasdasd',
    city_id: City.first.id)
else
  user.update(password: 'asdasdasd',
              city_id: City.first.id)
end
puts "Log in with: admin@admin.admin, password: 'asdasdasd'"
