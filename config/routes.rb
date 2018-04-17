Rails.application.routes.draw do
  devise_for :users, path: 'auth'

  root to: 'welcome#index'
  # user_root_path to: 'users#index'
  # root to: "home#index"

  resources :users do
    resources :books, controller: :items, type: 'Book'
    resources :games, controller: :items, type: 'Game'
    resources :movies, controller: :items, type: 'Movie'
    resources :households, controller: :items, type: 'Household'
    resources :clothings, controller: :items, type: 'Clothing'
  end

  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items

  # user_root to: 'users#index'

end
