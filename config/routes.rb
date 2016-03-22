Rails.application.routes.draw do

  root 'sessions#new'
  
  resources :items do
    post :borrow
    post :return
  end
  
  resources :users, except: [:new]
  get 'register', to: 'users#new'
  
  resources :schools, except: [:show]
  
  get 'activity', to: 'activities#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
	
	resources :password_resets

end
