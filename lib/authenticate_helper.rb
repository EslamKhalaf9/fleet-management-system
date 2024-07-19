module AuthenticateHelper
  def authenticate_user
    if JwtService.decode(request)
      user_id = JwtService.decode(request)[0]['user_id']
      @current_user = User.find_by(id: user_id)
      render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
    else
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end
  def user_sign_in?
    !!current_user
  end
  def current_user
    @current_user
  end
end