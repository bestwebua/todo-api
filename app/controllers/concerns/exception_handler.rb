module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotUnique, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :four_zero_one
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
  end

  private

    def four_zero_one(error)
      json_response({ message: error.message }, :unauthorized)
    end

    def four_zero_four(error)
      json_response({ message: error.message }, :not_found)
    end

    def four_twenty_two(error)
      json_response(Auth::Error422MessageService.call(error), :unprocessable_entity)
    end
end
