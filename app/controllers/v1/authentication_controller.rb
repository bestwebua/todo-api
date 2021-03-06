# frozen_string_literal: true

module V1
  class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      auth_token =
        Auth::AuthenticateUserService.call(email: auth_params[:email], password: auth_params[:password])
      json_response(auth_token: auth_token)
    end

    def destroy
      current_user.toggle!(:sign_out)
      head :no_content
    end

    private

    def auth_params
      params.permit(:email, :password)
    end
  end
end
