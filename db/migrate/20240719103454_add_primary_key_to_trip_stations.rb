class AddPrimaryKeyToTripStations < ActiveRecord::Migration[7.1]
  def change
    add_column :trip_stations, :id, :primary_key
  end
end
