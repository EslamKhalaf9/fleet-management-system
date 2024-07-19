class TripStation < ApplicationRecord
  belongs_to :trip, class_name: "Trip", foreign_key: "trip_id"
  belongs_to :station, class_name: "Station", foreign_key: "station_id"
end