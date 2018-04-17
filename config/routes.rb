Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root 'welcome#index'
  # root to: "home#index"

  resources :users
  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items


end
