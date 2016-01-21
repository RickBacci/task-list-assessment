Rails.application.routes.draw do

  resources :task_lists do
    resources :tasks
  end

  resources :users,      only: [:new, :create]
  resources :sessions,   only: [:new, :create, :destroy]

  delete    :logout,        to: 'sessions#destroy'
  post     :update_task_status, to: 'tasks#update_status'
  # patch   '/task_lists/:tasklist_id/task_status/:task_id', to: 'tasks#update_status', as: :update_task_status
  root 'tasks#index'
end
