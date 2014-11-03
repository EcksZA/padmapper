Rails.application.routes.draw do

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

	root to: 'properties#index'
	
	resources :properties, only: [:index]
	resources :sessions, only: [:new, :create, :destroy]

  resources :users do
  	resources :properties, except: [:index]
  end
end
