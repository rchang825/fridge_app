Rails.application.routes.draw do
  resources :shopping_list_items
  resources :shopping_items
  resources :fridge_item_taggings
  resources :tags
  resources :groceries
  devise_for :users
  resources :fridge_items do
    member do
      post :increment_quantity
      post :decrement_quantity
      get :inline_edit
    end
  end
  get 'home/about'
  root 'fridge_items#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
