Rails.application.routes.draw do
  resources :recipes
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :index]

  root "welcome#home"
  get '/signup', to: "user#new"
  get '/login', to: "session#new"
  delete '/logout', to: "sessions#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
