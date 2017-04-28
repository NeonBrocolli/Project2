Rails.application.routes.draw do
  root 'pages#home'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :warehouses do
    resources :events, shallow: true
  end

  get '/profile', to: 'users#show', as: :profile
  patch '/profile', to: 'users#update'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
