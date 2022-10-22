Rails.application.routes.draw do
  # resources :expenses
  # devise_for :users
  # resources :users
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 resources :categories do
    resources :expenses
  end
  # Defines the root path route ("/")
  root "categories#index"
end
