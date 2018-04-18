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
    resources :loans, only: :index
  end

  resources :loans, only: [:create, :update]
  resources :items

  post "borrow", to: "loans#create", as: "borrow"
  post "return", to: "loans#update", as: "return"

  # user_root to: 'users#index'

end
