Rails.application.routes.draw do
  resources :grocery_taggings
  resources :shopping_list_items do
    member do
      post :check_off_shopping_list_item
      get :add_to_fridge
      get :edited_add_to_fridge
      post :decline_add_to_fridge
      get :undo_add_to_fridge
    end
  end
  resources :tags
  resources :groceries
  devise_for :users
  resources :fridge_items do
    member do
      post :increment_quantity
      post :decrement_quantity
      get :inline_edit
      post :add_to_shopping_list
      get :edited_add_to_shopping_list
      post :decline_add_to_shopping_list
    end
  end
  resources :meals do
    resources :ingredients
  end
  resources :ingredients, :only => [ :index, :delete ]
  get 'home/about'
  root 'fridge_items#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
