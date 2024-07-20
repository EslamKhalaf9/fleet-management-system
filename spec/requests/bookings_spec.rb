require "rails_helper"

describe "Bookings API", type: :request do
  before(:all) do
    Rails.application.load_seed
  end
  let(:user) { UserService.create_user("testUser", "test@mail.com", "password") }
  let!(:trip) { Trip.first }
  let(:seat) { Seat.first }
  describe "POST /bookings" do
    it "should return unauthorized when not authenticated" do
      post bookings_path
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return seat already booked when seat is already booked" do
      post bookings_path, headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" }, params: { booking: { seat_id: seat.id, trip_id: trip.id, from_station_id: 1, to_station_id: 2 } }
      post bookings_path, headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" }, params: { booking: { seat_id: seat.id, trip_id: trip.id, from_station_id: 1, to_station_id: 2 } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should create a new booking" do
      post bookings_path, headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" }, params: { booking: { seat_id: 2, trip_id: 1, from_station_id: 1, to_station_id: 2 } }
      expect(response).to have_http_status(:created)
    end
  end
end