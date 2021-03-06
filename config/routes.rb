Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :recipes

  resources :users, only: [:new, :create, :show] do
    resources :reviews, only: [:index]
    get '/reviewed_recipes', to: "recipes#index", as: 'reviewed_recipes'
  end
  
  resources :main_spirits, only: [:index, :show] do 
    resources :recipes, only: [:new, :create, :index]
  end


  root "welcome#home"
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/top_rated', to: "recipes#top_rated"
  get '*path', to: 'application#not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
