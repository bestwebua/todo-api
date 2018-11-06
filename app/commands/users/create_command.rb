module Users
  class CreateCommand
    def self.call(user_params)
      user = User.create!(user_params)
      auth_token = Auth::AuthenticateUserService.call(email: user.email, password: user.password)
      { message: Auth::MessageService.account_created, auth_token: auth_token }
    end
  end
end
