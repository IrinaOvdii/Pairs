Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :pairs

  namespace :api do
    root to: 'pages#home'
    devise_for :users
    resources :pairs
  end
end
