class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  rescue_from ActionController::ParameterMissing, with: :handle_invalid_record

  def encode_token(payload)
    JWT.encode(payload, 'secret_key') 
  end

  def decoded_token
      header = request.headers['Authorization']
      if header
          token = header.split(" ")[1]
          begin
              JWT.decode(token, 'secret_key')
          rescue JWT::DecodeError
              nil
          end
      end
  end

  
  def handle_invalid_record(e)
    render json: { errors: e }, status: :unprocessable_entity
  end
end
