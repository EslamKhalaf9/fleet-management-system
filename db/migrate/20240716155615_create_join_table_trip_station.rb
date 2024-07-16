class CreateJoinTableTripStation < ActiveRecord::Migration[7.1]
  def change
    create_join_table :trips, :stations, table_name: :trip_stations do |t|
      t.index :trip_id
      t.index :station_id
    end
  end
end
