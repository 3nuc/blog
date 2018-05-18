Rails.application.routes.draw do
	get 'public/home'

	resources :users
	resources :blogbases

	root 'public#home'
end