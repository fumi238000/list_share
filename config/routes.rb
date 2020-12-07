Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :categorys
  root to: 'tasks#index'
end
