Rails.application.routes.draw do

  resources :posts do
    resources :comments, except: [:show]
  end

  resource :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]

  # Defines the root path route ("/")
  root "posts#index"
end
