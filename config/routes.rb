Rails.application.routes.draw do
  # get 'categories#index'
  # get 'cart', to: 'cart#show'
  # post 'cart/add'
  # post 'cart/remove'
  
  
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :products
  root "products#index"
  # get "/users/sign_up", to: "pages#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
