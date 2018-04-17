Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    resources :books, controller: :items, type: 'Book'
    resources :games, controller: :items, type: 'Game'
    resources :movies, controller: :items, type: 'Movie'
    resources :household_items, controller: :items, type: 'HouseholdItem'
    resources :clothing_items, controller: :items, type: 'ClothingItem'
  end

  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items
end
