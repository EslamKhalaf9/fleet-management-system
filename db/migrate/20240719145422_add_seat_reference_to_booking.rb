class AddSeatReferenceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :seat, null: false, foreign_key: true
  end
end
