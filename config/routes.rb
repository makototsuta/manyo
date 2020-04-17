Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  root to: 'tasks#index'
  resources :tasks do
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
