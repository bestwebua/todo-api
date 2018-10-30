Rails.application.routes.draw do
  post 'auth', to: 'users#create'
  post 'auth/sign_in', to: 'authentication#authenticate'
  get 'auth/sign_out', to: 'authentication#sign_out'

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
