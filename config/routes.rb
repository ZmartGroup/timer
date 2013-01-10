Timer::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"


	match "oauth/callback" => "oauths#callback"
	match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

	resources :categories
	resources :works
	root to: 'works#index'
end
