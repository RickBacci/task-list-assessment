Rails.application.routes.draw do

  resources :tasks, only: [:index]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  delete '/logout', to: 'sessions#destroy'

  root 'tasks#index'
end
