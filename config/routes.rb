Rails.application.routes.draw do

  resources :tasks, only: [:index]
  resources :users, only: [:new, :create]

  root 'tasks#index'
end
