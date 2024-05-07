Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # Each user will have one pantry
  get "my_pantry" => "pantries#show", as: :pantry
  get "shopping_list" => "shopping_lists#show", as: :shopping_list
  
  resources :pantries, only: [:create]
  resources :items, only: [:new, :create, :edit, :update, :destroy]
end
