class Trip < ApplicationRecord
  has_many :bookings
  has_many :trip_stations, dependent: :destroy
  has_many :stations, through: :trip_stations
  has_many :seats, dependent: :destroy
end
