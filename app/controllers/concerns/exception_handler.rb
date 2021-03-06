# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidSecretKey < StandardError; end
  class RegistrationError < StandardError; end
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class UpdateRecordError < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :error_401
    rescue_from ActiveRecord::RecordNotFound, with: :error_404
    rescue_from ActiveRecord::RecordInvalid,
                ActiveRecord::RecordNotUnique,
                ExceptionHandler::RegistrationError,
                ExceptionHandler::UpdateRecordError,
                ExceptionHandler::MissingToken,
                ExceptionHandler::InvalidToken, with: :error_422
    rescue_from ExceptionHandler::InvalidSecretKey, with: :error_500
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

  def error_500(error)
    json_response({ message: error.message }, :internal_server_error)
  end
end
