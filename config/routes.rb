Rails.application.routes.draw do

  resources :task_lists do
    resources :tasks,      only: [:index, :new, :create]
  end

  resources :users,      only: [:new, :create]
  resources :sessions,   only: [:new, :create, :destroy]

  delete    :logout, to: 'sessions#destroy'

  root 'tasks#index'
end
