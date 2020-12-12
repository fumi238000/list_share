Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'tasks#index'

  resources :categorys
  resources :tasks
  resources :comments, :only => [:index]

  # mypage
  resources :users, :only => [:show]
  
  
end
