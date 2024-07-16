# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# seeding stations
puts "Seeding stations..."
["Cairo", "Giza", "AlFayum", "Alminya", "Asyut"].each do |station_name|
  puts "  - #{station_name}"
  Station.find_or_create_by!(name: station_name)
end

# seeding trips
puts "Seeding trips..."

trips = Trip.all
trips.each do |trip|
  trip.destroy
end

trip = Trip.create!
puts "  - #{trip.id}"
stations = Station.all
stations.each_with_index do |station, index|
  puts "  - #{station.name}"
  TripStation.create!(
    trip_id: trip.id,
    station_id: station.id,
    order: index + 1
  )
end


