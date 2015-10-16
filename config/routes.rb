Rails.application.routes.draw do
  resources :cart_products
  resources :carts
  resources :products
  resources :cities
  devise_for :users, controllers: { registrations: 'user/registrations' }
  root to: 'visitors#index'
end
