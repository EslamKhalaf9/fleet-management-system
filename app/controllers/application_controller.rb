include AuthenticateHelper

class ApplicationController < ActionController::API
  before_action :authenticate_user
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  rescue_from ActionController::ParameterMissing, with: :handle_invalid_record
  
  def handle_invalid_record(e)
    render json: { errors: e }, status: :unprocessable_entity
  end
end
