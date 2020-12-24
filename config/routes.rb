Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users do
    delete :clean, on: :member
  end

  resources :tasks do
    resource :checks, only: %i[create destroy]
  end
  
  resources :categorys,only: %i[index new create edit update destroy]
  resources :category,only: %i[edit]
  resources :tasks
  resources :comments 
  resources :participations, only: %i[index new show create destroy]

  # mypage
  resources :users, only: %i[show create edit update destroy]  
  
end
