Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :tasks
  resources :categorys
  
  # mypage
  resources :users, :only => [:show]
  
  # 一時的にcategoryをrootに設定
  # root to: 'tasks#index'
  root to: 'categorys#index'

end
