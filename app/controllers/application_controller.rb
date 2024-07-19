class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  rescue_from ActionController::ParameterMissing, with: :handle_invalid_record
  
  def handle_invalid_record(e)
    render json: { errors: e }, status: :unprocessable_entity
  end
end
