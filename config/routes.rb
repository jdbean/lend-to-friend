Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    resources :books, controller: :items, type: 'Book'
    resources :games, controller: :items, type: 'Book'
    resources :movies, controller: :items, type: 'Book'
    resources :household_items, controller: :items, type: 'Book'
    resources :clothing_items, controller: :items, type: 'Book'
  end

  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items
end
