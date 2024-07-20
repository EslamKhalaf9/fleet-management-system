require 'rails_helper'

describe "Auth API", type: :request do
  describe "POST /auth" do
    it "should return unauthorized if credentials are invalid" do
      post auth_path, params: { auth: { username: "admin", password: "password" }}

      expect(response).to have_http_status(:unauthorized) 
    end

    it "should return token if credentials are valid" do
      user = User.create(username: "admin", email: "admin@mail.com", password: "password")
      post auth_path, params: { auth: { username: user.username, password: "password" }}
      expect(response).to have_http_status(:created)
      expect(response.body).to include("auth_token")
    end
  end

  describe "GET /auth" do
    it "should return unauthorized when not authenticated" do
      get auth_path
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return all users if authenticated" do
      user = User.create(username: "admin", email: "admin@mail.com", password: "password")
      get auth_path, headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" }
      expect(response).to have_http_status(:ok)
    end
  end
end