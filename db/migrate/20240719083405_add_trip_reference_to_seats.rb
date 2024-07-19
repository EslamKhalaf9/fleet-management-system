class AddTripReferenceToSeats < ActiveRecord::Migration[7.1]
  def change
    add_reference :seats, :trip, null: false, foreign_key: true
    remove_column :seats, :number
  end
end
