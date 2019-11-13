# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      json_response(Users::CreateCommand.call(user_params), :created)
    end

    private

    def user_params
      if params[:password] != params[:password_confirmation]
        raise(ExceptionHandler::RegistrationError,
              Auth::MessageService.password_error)
      end
      params.permit(:email, :password)
    end
  end
end
