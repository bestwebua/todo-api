module Auth
  class MessageService
    class << self
      def invalid_credentials
        'Invalid credentials'
      end

      def invalid_token
        'Invalid token'
      end

      def missing_token
        'Missing token'
      end

      def account_created
        'Account created successfully'
      end

      def account_not_created
        'Account could not be created'
      end

      def password_error
        "Passwords don't match"
      end

      def update_task_error
        "Can't update record. Task is already done"
      end
    end
  end
end
