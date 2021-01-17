Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  get 'about', to: 'pages#about'
  
  # Articles
  resources :articles

  # Users
  get 'signup', to: 'users#new'
  resources :users, except: [ :new ]

  # Auth ( Login/ Logout)
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  # Categories
  resources :categories, except: [ :destroy ]
end
