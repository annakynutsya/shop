Rails.application.routes.draw do
  
  get '/carts/:id', to: 'carts#show'
  get '/carts/:id' => "carts#show"
  delete 'carts/:id' => "carts#destroy"
  post 'carts_products:id/add' => "carts_products#add_quantity", as: "carts_product_add"
  post 'carts_products/:id/reduce' => "carts_products#reduce_quantity", as: "carts_product_reduce"
  post 'carts_products' => "carts_products#create"
  get 'carts_products/:id' => "carts_products#show", as: "carts_product"
  delete 'carts_products/:id' => "carts_products#destroy"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :products
  resources :carts
  resources :orders
  
  root "products#index"
  # get "/users/sign_up", to: "pages#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
