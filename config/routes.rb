Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :pairs
  resources :users, only: [:index, :edit, :update]

  namespace :api do
    root to: 'pages#home'
    devise_for :users
    resources :users, only: [:index, :edit, :update]
    resources :pairs
  end
end
