Rails.application.routes.draw do
  scope :api, module: :v1, constraints: Api::VersionService.new(:v1, true) do
    scope :auth do
      post '/', to: 'users#create'
      post '/sign_in', to: 'authentication#authenticate'
      get '/sign_out', to: 'authentication#sign_out'
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
  end
end
