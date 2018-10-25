module Auth
  class MessageService
    class << self
      def not_found(record = 'record')
        "#{record} not found."
      end

      def invalid_credentials
        'Invalid credentials'
      end

      def invalid_token
        'Invalid token'
      end

      def missing_token
        'Missing token'
      end

      def unauthorized
        'Unauthorized request'
      end

      def account_created
        'Account created successfully'
      end

      def account_not_created
        'Account could not be created'
      end

      def expired_token
        'Your token has expired. Please login to continue.'
      end

      def password_error
        "Passwords don't match"
      end
    end
  end
end
