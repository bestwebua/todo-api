module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      user = User.create!(user_params)
      auth_token = Auth::AuthenticateUserService.call(email: user.email, password: user.password)
      response = { message: Auth::MessageService.account_created, auth_token: auth_token }
      json_response(response, :created)
    end

    private

      def user_params
        raise(ExceptionHandler::RegistrationError,
          Auth::MessageService.password_error) if params[:password] != params[:password_confirmation]
        params.permit(:email, :password)
      end
  end
end
