class AddStationsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :from_station_id, :integer
    add_column :bookings, :to_station_id, :integer
  end
end
