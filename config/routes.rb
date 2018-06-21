Rails.application.routes.draw do
	get 'public/home'

	resources :users
	resources :blogbases
	resources :entries
	resources :comments

	root 'public#home'
end