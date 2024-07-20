require 'rails_helper'

describe "Users API", type: :request do

  let(:user) { UserService.create_user("test", "test@mail.com", "password") }
  
  describe "POST /users" do
    it "should create a new user" do
      post users_path, params: { user: { username: "test2", email: "test2@mail.com", password: "password" } }

      expect(response).to have_http_status(:created)
    end

    it "should not create a new user with invalid email" do
      post users_path, params: { user: { username: "admin3", email: "admin3", password: "password" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should not create a new user if the username already exists" do
      post users_path, params: { user: { username: "admin", email: "admin4@mail.com", password: "password" } }
      post users_path, params: { user: { username: "admin", email: "admin5@mail.com", password: "password" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should not create a new user if the email already exists" do
      post users_path, params: { user: { username: "admin6", email: "admin@mail.com", password: "password" } }
      post users_path, params: { user: { username: "admin7", email: "admin@mail.com", password: "password" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /users" do
    it "should return unauthorized when not authenticated" do
      get users_path
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return all users if authenticated" do
      get users_path, headers: { "Authorization" => "Bearer #{JwtService.encode(user_id: user.id)}" }
      expect(response).to have_http_status(:ok)
    end
  end
end