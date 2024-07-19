class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  def index
    @users = User.all
    render json: @users
  end

  def create 
    user = User.new(user_params)
    if user.save
      @token = JwtService.encode(user_id: user.id)
      render json: { auth_token: @token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end