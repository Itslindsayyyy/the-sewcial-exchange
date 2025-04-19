Rails.application.routes.draw do
  # Auth
  devise_for :users
  resource :account, only: [ :show, :update ], controller: "users", as: :account


  # Core resources
  resources :swap_groups
  resources :group_memberships
  resources :swaps
  resources :swap_tasks
  resources :user_swap_tasks, only: [ :update ]

  # System features
  resources :notifications, only: [ :index, :show ]
  resources :resources
  resources :feedback_forms

  # General
  root "home#index"
  get "/profile", to: redirect("/account")
  get "up" => "rails/health#show", as: :rails_health_check
end
