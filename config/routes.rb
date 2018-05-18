Rails.application.routes.draw do
	get 'public/home'

	resources :users
	resources :blogbases
	resources :entries

	root 'public#home'
end