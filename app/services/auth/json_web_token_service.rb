# frozen_string_literal: true

module Auth
  class JsonWebTokenService
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    class << self
      def encode(payload, exp = 24.hours.from_now)
        check_secret_key
        payload[:exp] = exp.to_i
        JWT.encode(payload, HMAC_SECRET)
      end

      def decode(token)
        check_secret_key
        body = JWT.decode(token, HMAC_SECRET).first
        HashWithIndifferentAccess.new(body)
      rescue JWT::DecodeError => e
        raise ExceptionHandler::InvalidToken, e.message
      end

      def check_secret_key
        unless HMAC_SECRET
          raise ExceptionHandler::InvalidSecretKey,
                Auth::MessageService.secret_key_not_assigned
        end
      end
    end
  end
end
