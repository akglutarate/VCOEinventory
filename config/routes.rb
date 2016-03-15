Rails.application.routes.draw do

  root 'pages#index'

  resources :items
  
  resources :users, except: [:new]
  get 'register', to: 'users#new'

end
