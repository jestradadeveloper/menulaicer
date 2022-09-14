Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard', to: 'dashboard#index'
  get '/settings', to: 'settings#index'
  put '/settings', to: 'settings#update'
  resources :menus, only: %i[new create]
end
