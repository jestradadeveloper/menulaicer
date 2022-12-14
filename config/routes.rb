Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope '(:locale)', locale: /en|es/ do
    root to: 'home#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard', to: 'dashboard#index'
  get '/settings', to: 'settings#index'
  put '/settings', to: 'settings#update'
  resources :qr_menus, only: :show
  resources :qr_codes, only: :show
  resources :menus, only: %i[new create destroy update show]
end
