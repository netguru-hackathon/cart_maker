Rails.application.routes.draw do
  resources :cart_products
  resources :carts
  resources :products
  resources :cities
  devise_for :users, controllers: { registrations: 'user/registrations' }
  root to: 'visitors#index'

  namespace :api do
    post :update, as: "add_product", to: "carts_controller#update"
  end
end
