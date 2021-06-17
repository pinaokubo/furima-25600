Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :purchases, only: [:index, :create]
  end
  namespace :users do
    resources :products, only: :index
  end
  # scope :products do
  #   resources :huga
  # end
  # namespace :products do
  #   resources :huga
  # end
end