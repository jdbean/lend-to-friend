Rails.application.routes.draw do
  devise_for :users, path: 'auth', controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'welcome#index'

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
  get "rating", to: "loans#rating", as: "rating"
  post "rating", to: "loans#rating", as: "rating_update"

  get '/games', to: "items#games", as: "games"
  get '/movies', to: "items#movies", as: "movies"
  get '/books', to: "items#books", as: "books"
  get '/households', to: "items#households", as: "households"
  get '/clothings', to: "items#clothings", as: "clothings"

  get '/stats', to: "lytics#index", as: "lytics"

end
