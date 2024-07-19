class JwtService
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode payload, "Secret"
  end

  def self.decode(request)
    header = request.headers['Authorization']
    if header
        token = header.split(" ")[1]
        begin
            JWT.decode(token, "Secret")
        rescue JWT::DecodeError
            nil
        end
    end
  end
end