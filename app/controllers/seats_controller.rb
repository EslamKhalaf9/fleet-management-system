class SeatsController < ApplicationController
  def show
    available_seats = TripService.get_available_seats(seat_params[:from_station], seat_params[:to_station])
    render json: available_seats
  end

  private 
  
  def seat_params
    # debugger
    params.permit(:from_station, :to_station)
  end
end