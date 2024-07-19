class AuthController < ApplicationController
  skip_before_action :authenticate_user, only: [:login]
  def show
    decoded_token = JwtService.decode request
    if decoded_token
      user_id = decoded_token[0]['user_id']
      user = User.find_by(id: user_id)
      render json: user
    else
      render json: { error: 'Not Authenticated' }, status: :unauthorized
    end
  end

  def login
    username = login_params[:username]
    password = login_params[:password]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      token = @token = JwtService.encode(user_id: user.id)
      render json: { auth_token: token }, status: :created
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:auth).permit(:username, :password)
  end
end