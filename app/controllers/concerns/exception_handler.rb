module ExceptionHandler
  extend ActiveSupport::Concern

  class RegistrationError < StandardError; end
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :error_404
    rescue_from ActiveRecord::RecordInvalid, with: :error_422
    rescue_from ActiveRecord::RecordNotUnique, with: :error_422
    rescue_from ExceptionHandler::RegistrationError, with: :error_422
    rescue_from ExceptionHandler::AuthenticationError, with: :error_401
    rescue_from ExceptionHandler::MissingToken, with: :error_422
    rescue_from ExceptionHandler::InvalidToken, with: :error_422
  end

  private

    def error_401(error)
      json_response({ message: error.message }, :unauthorized)
    end

    def error_404(error)
      json_response({ message: error.message }, :not_found)
    end

    def error_422(error)
      json_response(Auth::Error422MessageService.call(error), :unprocessable_entity)
    end
end
