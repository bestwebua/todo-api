# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('api/documentation')

  scope :api, module: :v1, constraints: Api::VersionService.new(:v1, true) do
    scope :auth do
      post '/', to: 'users#create'
      post '/sign_in', to: 'authentication#create'
      get '/sign_out', to: 'authentication#destroy'
    end

    resources :projects do
      resources :tasks do
        member do
          patch :complete
          patch :position
        end
        resources :comments, only: %i[index create destroy]
      end
    end

    resources :documentation, only: :index
  end
end
