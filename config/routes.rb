Rails.application.routes.draw do
  get 'public/home'

  resources :users

  root 'public#home'
end