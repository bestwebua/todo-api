# frozen_string_literal: true

module Auth
  class AuthenticateUserService
    def initialize(email:, password:)
      @email, @password = email, password
    end

    def call
      persist if user
    end

    def self.call(**user_credentials)
      new(user_credentials).call
    end

    private

    attr_reader :email, :password

    def user
      user = User.find_by(email: email)
      return user if user&.authenticate(password)

      raise(ExceptionHandler::AuthenticationError, Auth::MessageService.invalid_credentials)
    end

    def persist
      user.toggle!(:sign_out) if user.sign_out?
      Auth::JsonWebTokenService.encode(user_id: user.id)
    end
  end
end
