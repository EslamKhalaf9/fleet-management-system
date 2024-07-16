module Api
  module V1
    class AuthController < ApplicationController
      def show
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
          token = encode_token({ user_id: user.id })
          render json: { user: UserSerializer.new(user), token: token }, status: :created
        else
          render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
      end

      private

      def login_params
        # debugger
        params.require(:auth).permit(:username, :password)
      end
    end
  end
end