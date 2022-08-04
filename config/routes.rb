Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get "/users/sign_up" => "devise/registrations#new"
    get "users", to: "devise/sessions#new"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  resources :users, only: [:index, :show, :create, :new]
  resources :groups
  resources :purchases
  resources :group_purchases
end
