module Auth
  class AuthorizeRequestService
    def initialize(headers = {})
      @headers = headers
    end

    def call
      { user: user }
    end

    def self.call(headers = {})
      new(headers).call
    end

    private

      attr_reader :headers

      def user
        @user ||= user_by_auth_token if decoded_auth_token && not_sign_out_user
        rescue ActiveRecord::RecordNotFound => error
          raise ExceptionHandler::InvalidToken, ("#{Auth::MessageService.invalid_token} #{error.message}")
      end

      def decoded_auth_token
        @decoded_auth_token ||= Auth::JsonWebTokenService.decode(http_auth_header)
      end

      def user_by_auth_token
        User.find(decoded_auth_token[:user_id])
      end

      def not_sign_out_user
        return true unless user_by_auth_token.sign_out?
        raise ExceptionHandler::InvalidToken, Auth::MessageService.invalid_token
      end

      def http_auth_header
        return headers['Authorization'].split(' ').last if headers['Authorization'].present?
        raise ExceptionHandler::MissingToken, Auth::MessageService.missing_token
      end
  end
end
