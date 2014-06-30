require "monban/constraints/signed_in"
Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
    resource :dashboard, only: [:show]
    resources :shouts, only: [:create]
  end
  
  root to: "sessions#new"
end
