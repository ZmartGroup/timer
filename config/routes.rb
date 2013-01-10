Timer::Application.routes.draw do


	post '/oauth/request_token' => 'sessions#new'

 	match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#new", :as => "login"

  resources :webhooks

	resources :categories
	resources :works
  resources :issues, only: [:index] 
	root to: 'works#index'
end
