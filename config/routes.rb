Rails.application.routes.draw do
  get 'sessions/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	get 'public/home'

	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	
	resources :users
	resources :sessions
	resources :blogbases
	resources :entries
	resources :comments

	root 'public#home'
end