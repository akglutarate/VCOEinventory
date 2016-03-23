Rails.application.routes.draw do

  get 'contact_form/new'

  get 'contact_form/create'

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
	
	get 'contact', to: 'messages#new', as: 'contact'
	post 'contact', to: 'messages#create'

end
