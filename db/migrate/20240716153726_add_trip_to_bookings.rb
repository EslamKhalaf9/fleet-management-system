class AddTripToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :trip, null: false, foreign_key: true
  end
end
