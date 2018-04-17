Rails.application.routes.draw do
  devise_for :users, path: 'auth'

  root to: 'welcome#index'
  # user_root_path to: 'users#index'
  # root to: "home#index"

  resources :users
  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items

  # user_root to: 'users#index'

end
