class TripService
  def self.get_available_seats(from_station_id, to_station_id)
    trip_ids = get_available_trips(from_station_id, to_station_id)
    available_seats = trip_ids.map do |trip_id|
      {
        trip_id: trip_id,
        seats: get_available_seats_by_trip(trip_id, from_station_id, to_station_id)
      }
    end
  end

  def self.get_available_trips(from_station_id, to_station_id)
    trips = TripStation
      .where(station_id: from_station_id) # get trips that goes through from_station -> trip_stations
      .joins("INNER JOIN trip_stations AS trips_stations_to ON trip_stations.trip_id = trips_stations_to.trip_id")
      .where("trips_stations_to.station_id = ?", to_station_id) # get trips that goes through to_station -> trips_stations_to
      .where("trip_stations.\"order\" < trips_stations_to.\"order\"") # get trips that goes through to_station -> trips_stations_to
      .pluck("trip_stations.trip_id")
      .uniq
  end

  def self.get_available_seats_by_trip(trip_id, from_station_id, to_station_id)


    booked_seats = Booking
      .where(trip_id: trip_id)

    available_booked_seats = []

    booked_seats.each do |booking|
      booking_to_order = TripStation.where(trip_id: booking.trip_id, station_id: booking.to_station_id).pluck(:order).first
      request_from_order = TripStation.where(trip_id: booking.trip_id, station_id: from_station_id).pluck(:order).first
      if request_from_order > booking_to_order
        available_booked_seats << booking.seat_id
      end
    end

    all_seats = Seat
      .where(trip_id: trip_id)
      .pluck(:id)
    
    available_seats = all_seats - booked_seats.pluck(:seat_id).uniq + available_booked_seats
    available_seats.sort
  end

end

