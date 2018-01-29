Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :pairs
  resources :users, only: [:index]
  #post 'admin' => 'users#admin', as: :admin
end
