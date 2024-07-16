class AddOrderToTripStation < ActiveRecord::Migration[7.1]
  def change
    add_column :trip_stations, :order, :integer
  end
end
