module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      json_response(Users::CreateCommand.call(user_params), :created)
    end

    private

      def user_params
        raise(ExceptionHandler::RegistrationError,
          Auth::MessageService.password_error) if params[:password] != params[:password_confirmation]
        params.permit(:email, :password)
      end
  end
end
