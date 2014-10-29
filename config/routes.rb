Rails.application.routes.draw do
	root to: 'properties#index'
	
	resources :properties, only: [:index]

  resources :users do
  	resources :properties, except: [:index]
  end
end
