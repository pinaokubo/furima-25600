Rails.application.routes.draw do
  devise_for :DeviseCreateUsers
  root to; 'products#index'
end
