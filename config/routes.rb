Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  resources :categorys
  resources :tasks
  resources :comments 
  resources :participations, only: %i[index new create destroy]
  resources :posts , only: %i[edit create update destroy]

  # mypage
  resources :users, only: %i[show create edit update destroy]  
  
end
