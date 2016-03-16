Rails.application.routes.draw do

  root 'pages#index'

  resources :items
  
  resources :users, except: [:new]
  get 'register', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
