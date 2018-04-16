Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :loans, only: [:index, :show, :new, :create, :edit, :update]
  resources :items
end
