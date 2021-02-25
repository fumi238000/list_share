# frozen_string_literal: true

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
    member do
      patch :move
    end
  end

  resources :categories

  resources :categories do
    member do
      patch :move
    end
  end

  resources :tasks
  # resources :category,only: %i[edit]

  resources :comments
  resources :participations, only: %i[new show create destroy]

  # mypage
  resources :users, only: %i[show create edit update destroy]
end
