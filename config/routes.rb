Rails.application.routes.draw do
  resources :reviews
  resources :main_spirits
  resources :recipes
  resources :users, only: [:new, :create, :show, :index]

  root "welcome#home"
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
