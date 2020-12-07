Rails.application.routes.draw do
  devise_for :users
  root to: 'task#index'
  resources :tasks
end
