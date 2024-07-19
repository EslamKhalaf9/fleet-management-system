class AddBusIdToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :bus_id, :integer
  end
end
