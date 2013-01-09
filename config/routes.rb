Timer::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  resources :sessions

	constraints(AuthenticatedConstraint) do
		resources :categories
		resources :works
		root to: 'works#index'
	end

	root to: 'sessions#new'
end
