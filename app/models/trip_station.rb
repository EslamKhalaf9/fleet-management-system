class TripStation < ApplicationRecord
  belongs_to :trips, class_name: "Trip", foreign_key: "trip_id"
  belongs_to :stations, class_name: "Station", foreign_key: "station_id"
end