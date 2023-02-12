Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'products#index'

  resources :categories, :products, only: [:index, :show]
  resources :orders

  resource :cart, only: [:show]
  resources :carts do
    member do
      post :add_product_to
      delete :remove_product_from
    end
  end
end
