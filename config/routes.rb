Timer::Application.routes.draw do


	post '/oauth/request_token' => 'sessions#new'

 	match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#new", :as => "login"


	resources :categories
	resources :works
	root to: 'works#index'
end
