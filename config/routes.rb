# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_up' => 'devise/registrations#new'
    get 'users', to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
  get '/user' => "group#index", :as => :user_root
  resources :users, only: %i[index show create new]
  resources :groups, only: [:index, :create, :new] do
    resources :purchases, only: [:index, :create, :new]
  end
  resources :group_purchases
end
