Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index'
  get 'task/:id', to: 'tasks#show', as: :task

  get 'tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create'

  get 'task/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'task/:id', to: 'tasks#update'
  patch 'task/:id/checkbox', to: "tasks#checkbox", as: :checkbox_task

  delete 'task/:id', to: "tasks#destroy"

  root to: 'tasks#index'
end
