Rails.application.routes.draw do

  namespace :v1 do
    resources :users
    resources :cars
    resources :reservations
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
