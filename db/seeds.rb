# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#seeds.rb

location_data = [
  { description: "Maggie Daley"},
  { description: "Riverside Gym"},
  { description: "The Park"}
  # Add more user data as needed
]

location_data.each do |loc|
  Location.create(loc)
end

courts_data = [
  { location: 1},
  { location: 1},
  { location: 2},
  { location: 2},
  { location: 3},
  { location: 3},
  { location: 3},
  { location: 3}
  # Add more user data as needed
]

courts_data.each do |court|
  Court.create(court)
end

#code to be modified: 

# Generate timeslots for Maggie Daley (Monday, Wednesday, Friday in May and June)
maggie_daley_court_id = 1
maggie_daley_start_time = DateTime.new(2000, 1, 1, 14, 0, 0)
maggie_daley_end_time = maggie_daley_start_time + 1.hour

maggie_daley_timeslots = []

(Date.new(2023, 5, 1)..Date.new(2023, 6, 30)).each do |date|
  if [1, 3, 5].include?(date.wday) # Monday, Wednesday, Friday
    [14, 15, 16].each do |hour| # 2 PM, 3 PM, 4 PM
      start_time = DateTime.new(date.year, date.month, date.day, hour, 0, 0)
      end_time = start_time + 1.hour

      maggie_daley_timeslots << { court_id: maggie_daley_court_id, available: true, date: date, time: start_time.strftime("%H:%M"), reserver_id: nil, reserved_at: nil, start_time: start_time, end_time: end_time }
    end
  end
end

# Generate timeslots for Riverside Gym (Saturdays)
riverside_gym_court_id = 2
riverside_gym_start_time = DateTime.new(2000, 1, 1, 10, 0, 0)
riverside_gym_end_time = riverside_gym_start_time + 1.hour

riverside_gym_timeslots = []

(Date.new(2023, 5, 1)..Date.new(2023, 6, 30)).each do |date|
  if date.wday == 6 # Saturday
    (10..14).each do |hour| # 10 AM to 2 PM
      start_time = DateTime.new(date.year, date.month, date.day, hour, 0, 0)
      end_time = start_time + 1.hour

      riverside_gym_timeslots << { court_id: riverside_gym_court_id, available: true, date: date, time: start_time.strftime("%H:%M"), reserver_id: nil, reserved_at: nil, start_time: start_time, end_time: end_time }
    end
  end
end

# Generate timeslots for The Park (Tuesday evenings)
the_park_court_id = 3
the_park_start_time = DateTime.new(2000, 1, 1, 18, 0, 0)
the_park_end_time = the_park_start_time + 1.hour

the_park_timeslots = []

(Date.new(2023, 5, 1)..Date.new(2023, 6, 30)).each do |date|
  if date.wday == 2 # Tuesday
    (18..21).each do |hour| # 6 PM to 9 PM
      start_time = DateTime.new(date.year, date.month, date.day, hour, 0, 0)
      end_time = start_time + 1.hour

      the_park_timeslots << { court_id: the_park_court_id, available: true, date: date, time: start_time.strftime("%H:%M"), reserver_id: nil, reserved_at: nil, start_time: start_time, end_time: end_time }
    end
  end
end

maggie_daley_timeslots.each do |timeslot|
  Timeslot.create(timeslot)
end

riverside_gym_timeslots.each do |timeslot|
  Timeslot.create(timeslot)
end

the_park_timeslots.each do |timeslot|
  Timeslot.create(timeslot)
end

