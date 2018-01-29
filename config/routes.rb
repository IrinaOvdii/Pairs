Rails.application.routes.draw do
  root to: 'pages#home'

  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  # scope :admins do
  #   root to: 'pages#home'
  # end
  #
  # scope :students do
  #   root to: 'pages#home'
  # end

  devise_for :users
end
