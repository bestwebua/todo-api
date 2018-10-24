module Auth
  class AuthorizeApiRequestService
    def initialize(headers = {})
      @headers = headers
    end

    def call
      { user: user }
    end

    def self.call(headers = {})
      self.new(headers).call
    end

    private

      attr_reader :headers

      def user
        @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
        rescue ActiveRecord::RecordNotFound => error
          raise ExceptionHandler::InvalidToken, ("#{Auth::MessageService.invalid_token} #{error.message}")
      end

      def decoded_auth_token
        @decoded_auth_token ||= Auth::JsonWebTokenService.decode(http_auth_header)
      end

      def http_auth_header
        return headers['Authorization'].split(' ').last if headers['Authorization'].present?
        raise ExceptionHandler::MissingToken, Auth::MessageService.missing_token
      end
  end
end
