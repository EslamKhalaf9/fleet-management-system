require 'rails_helper'

describe "Seats API", type: :request do
  before(:all) do
    Rails.application.load_seed
  end
  let(:user) { UserService.create_user("testUser", "test@mail.com", "password") }

  describe "GET /seats" do

    it "should return unauthorized when not authenticated" do
      get("/seats/1/2")
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return all seats" do
      get("/seats/1/2", headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" })

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("trip_id")
      expect(response.body).to include("seats")
    end
    
    it "should return empty array when providing invalid station ids" do
      get("/seats/0/0", headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq("[]")
    end
  end
end