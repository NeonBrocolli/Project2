Rails.application.routes.draw do
  root 'pages#home'

  get 'users/new', to: 'users#new'

  post 'users/new', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
