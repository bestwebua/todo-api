# frozen_string_literal: true

module Auth
  class Error422MessageService
    def self.call(error)
      error_message = error.message
      not_uniq_error = !!error_message[/index_users_on_email/]
      { message: not_uniq_error ? Auth::MessageService.account_not_created : error_message }
    end
  end
end
