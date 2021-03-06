require "monban/constraints/signed_in"
Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  get "/:username", to: "users#show", as: :user
  resources :users, only: [:new, :create,] do
    resource :following_relationship, only: [:create, :destroy]
  end
  resource :following, only: [:show]
  resource :followers, only: [:show]
 
  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
    resource :dashboard, only: [:show]
    resources :text_subjects, only: [:create]
    resources :image_subjects, only: [:create]
  end
  
  root to: "sessions#new"
end
