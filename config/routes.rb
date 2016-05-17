Rails.application.routes.draw do

  get 'contact_form/new'

  get 'contact_form/create'

  root 'sessions#new'
  
  resources :items do
    post :borrow
    post :return
		post :ownership
		post :seek
  end
  
  resources :users, except: [:new]
  get 'register', to: 'users#new'
  
  resources :schools, except: [:show]
	
	resources :password_resets
  
  resources :protocols, only: [:index, :show] do
    post :add
    post :update_value
  end
  
  get 'activity', to: 'activities#index'
	get 'report', to: 'activities#report'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
	
	get 'contact', to: 'messages#new', as: 'contact'
	post 'contact', to: 'messages#create'
	
	get 'assessment_ownership', to: 'assessment_ownerships#index'
	post 'assessment_ownership', to: 'assessment_ownerships#update'

end
