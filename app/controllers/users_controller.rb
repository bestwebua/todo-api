class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    auth_token = Auth::AuthenticateUserService.call(email: user.email, password: user.password)
    response = { message: Auth::MessageService.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
