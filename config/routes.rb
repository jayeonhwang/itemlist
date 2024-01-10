Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/items" => "items#index"
  get "/items/:id" => "items#show"
  post "/items" => "items#create"
  patch "/items/:id" => "items#update"
  delete"/items/:id" => "items#destroy"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end

