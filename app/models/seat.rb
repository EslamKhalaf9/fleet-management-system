class Seat < ApplicationRecord
  belongs_to :trip
  has_many :bookings
end
