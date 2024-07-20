class BookingsController < ApplicationController

  def index
    render json: @current_user.bookings
  end

  def all
    render json: Booking.all
  end

  def create 
    if check_seat(booking_params[:seat_id], booking_params[:trip_id], booking_params[:from_station_id], booking_params[:to_station_id])
      booking = Booking.new
      booking.user_id = @current_user.id
      booking.trip_id = booking_params[:trip_id]
      booking.seat_id = booking_params[:seat_id]
      booking.from_station_id = booking_params[:from_station_id]
      booking.to_station_id = booking_params[:to_station_id]
      if booking.save
        render json: booking
      else
        render json: { error: booking.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "seat already booked" }, status: :unprocessable_entity
    end
  end

  def check_seat(seat_id, trip_id, from_station_id, to_station_id)
    TripService.get_available_seats_by_trip(trip_id.to_i, from_station_id.to_i, to_station_id.to_i).include?(seat_id.to_i)
  end

  def booking_params
    params.require(:booking).permit(:trip_id, :seat_id, :from_station_id, :to_station_id)
  end
end
