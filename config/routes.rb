Rails.application.routes.draw do
  root 'carts#index'
  resources :cart_products
  resources :carts do
    get :add_products, on: :member
  end
  resources :products
  resources :cities
  devise_for :users, controllers: { registrations: 'user/registrations' }

  namespace :api do
    post :update, as: "add_product", to: "carts#update"
  end
end
