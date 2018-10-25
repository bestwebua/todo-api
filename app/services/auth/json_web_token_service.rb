module Auth
  class JsonWebTokenService
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    class << self
      def encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, HMAC_SECRET)
      end

      def decode(token)
        body = JWT.decode(token, HMAC_SECRET).first
        HashWithIndifferentAccess.new(body)
        rescue JWT::DecodeError => error
          raise ExceptionHandler::InvalidToken, error.message
      end
    end
  end
end
