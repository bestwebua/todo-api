# frozen_string_literal: true

module V1
  class ApplicationController < ActionController::API
    include ::Response
    include ::ExceptionHandler

    before_action :authorize_request
    attr_reader :current_user

    private

    def authorize_request
      @current_user = Auth::AuthorizeRequestService.call(request.headers)[:user]
    end
  end
end
