module Auth
  class Error422MessageService
    def self.call(error)
      not_uniq_error = !!error.message[/index_users_on_email/]
      message = not_uniq_error ? Auth::MessageService.account_not_created : error.message
      { message: message }
    end
  end
end
