Rails.application.routes.draw do

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  scope :admins, :students do
    root to: 'pages#home'
  end

  devise_for :users
end
