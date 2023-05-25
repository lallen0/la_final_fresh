# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location_data = [
  { description: "Maggie Daley 2"},
  { description: "Riverside Gym 2"},
  { description: "The Park 2"},
  # Add more user data as needed
]

location_data.each do |loc|
  Location.create(loc)
end



# timeslot_data = [
#   { court_id: 1, available: true, date: , time: , reserver_id = nil, reserved_at = nil, start_time = , end_time = },
#   { name: 'Jane Smith', email: 'jane@example.com' },
#   # Add more user data as needed
# ]

# timeslot_data.each do |timeslot|
#   User.create(timeslot)
# end
