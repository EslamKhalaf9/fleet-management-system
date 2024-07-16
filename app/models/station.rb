class Station < ApplicationRecord
  has_many :booking1, :class_name => "Booking", :foreign_key => "to_station_id"
  has_many :booking2, :class_name => "Booking", :foreign_key => "from_station_id"
  has_many :trip_stations
  has_many :trips, through: :trip_stations
end
