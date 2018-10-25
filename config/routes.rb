Rails.application.routes.draw do
  post 'auth/sign_in', to: 'authentication#authenticate'

  resources :projects do
    resources :tasks
  end
end
