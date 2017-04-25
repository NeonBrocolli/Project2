Rails.application.routes.draw do
  root 'pages#home'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # resources :warehouses

  # resources :events

  # post 'users/new', to: 'users#create', as: :profile
  # get 'users/new', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
end
