Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'products#index'

  # get 'cart', to: 'carts#show', as: :cart
  # post 'cart/:id', to: 'carts#create', as: :carts
  # delete 'cart/:id', to: 'carts#destroy', as: :cart_product

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :orders

  resources :carts do
    member do
      post :add_product
    end

    collection do
      get :show
    end
  end
end
