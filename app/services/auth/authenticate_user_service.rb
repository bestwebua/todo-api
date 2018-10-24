module Auth
  class AuthenticateUserService
    def initialize(email:, password:)
      @email, @password = email, password
    end

    def call
      Auth::JsonWebTokenService.encode(user_id: user.id) if user
    end

    def self.call(**user_credentials)
      new(user_credentials).call
    end

    private

      attr_reader :email, :password

      def user
        user = User.find_by(email: email)
        return user if user && user.authenticate(password)
        raise(ExceptionHandler::AuthenticationError, Auth::MessageService.invalid_credentials)
      end
  end
end
