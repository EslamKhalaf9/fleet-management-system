class Trip < ApplicationRecord
  has_many :bookings
  has_many :trip_stations
  has_many :stations, through: :trip_stations
end
