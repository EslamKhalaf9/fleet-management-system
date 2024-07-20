TripStation.destroy_all
Booking.destroy_all
Seat.destroy_all
Trip.destroy_all
Station.destroy_all
User.destroy_all

User.find_or_create_by!(username: "admin", email: "admin@mail.com", password_digest: "$2a$12$vQx8RhqVbq.za6yQIqOR4uYOLA99O5.nbSrJSIeg/BrkXU1IXJS.i")
# seeding stations
puts "Seeding stations..."
stations = ["Cairo", "Giza", "AlFayum", "Alminya", "Asyut"]
stations.each do |station_name|
  puts "seeding - #{station_name}"
  Station.find_or_create_by!(id: stations.index(station_name) + 1, name: station_name)
end

# seeding trips
puts "Seeding trips..."

trip = Trip.find_or_create_by!(bus_id: 1)
puts "seeding - #{trip.id}"

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


