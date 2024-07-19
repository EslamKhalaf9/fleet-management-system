TripStation.destroy_all

# seeding stations
puts "Seeding stations..."
["Cairo", "Giza", "AlFayum", "Alminya", "Asyut"].each do |station_name|
  puts "  - #{station_name}"
  Station.find_or_create_by!(name: station_name)
end

# seeding trips
puts "Seeding trips..."

trip = Trip.find_or_create_by!(bus_id: 1)
puts "  - #{trip.id}"

puts "seeding trip's seats..."
12.times do |index|
  Seat.find_or_create_by!(id: index + 1, trip_id: trip.id)
end

puts "Seeding trip_stations..."
stations = Station.all
stations.each_with_index do |station, index|
  TripStation.create!(
    trip_id: trip.id,
    station_id: station.id,
    order: index + 1
  )
end


