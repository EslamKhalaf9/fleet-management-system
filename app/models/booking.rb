class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :from_station, :class_name => "Station"
  belongs_to :to_station, :class_name => "Station"
end
