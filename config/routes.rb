Rails.application.routes.draw do
  resources :carts
  resources :products
  resources :cities
  devise_for :users
  root to: 'visitors#index'
end
