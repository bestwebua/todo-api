Rails.application.routes.draw do
  post 'auth', to: 'users#create'
  post 'auth/sign_in', to: 'authentication#authenticate'

  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
end
