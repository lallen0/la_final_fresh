# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#seeds.rb

Timeslot.delete_all
Court.delete_all
Location.delete_all

location_data = [
  { description: "Maggie Daley" },
  { description: "Riverside Gym" },
  { description: "The Park" },
# Add more user data as needed
]

location_data.each do |loc|
  Location.create(loc)
end

maggie_daley_court_id = Location.find_by(description: "Maggie Daley").id
riverside_id = Location.find_by(description: "Riverside Gym").id
park_id = Location.find_by(description: "The Park").id

courts_data = [
  { location_id: maggie_daley_court_id },
  { location_id: maggie_daley_court_id },
  { location_id: riverside_id },
  { location_id: riverside_id },
  { location_id: park_id },
  { location_id: park_id },
  { location_id: park_id },
  { location_id: park_id },
# Add more user data as needed
]

courts_data.each do |court|
  Court.create(court)
end

#code to be modified:
