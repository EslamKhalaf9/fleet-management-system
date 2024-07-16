class TripStation < ApplicationRecord
  belongs_to :trips
  belongs_to :stations
end