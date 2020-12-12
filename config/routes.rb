Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/categories' => 'categories#index'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories/create' => 'categories#create', as: 'create_category'
  get '/categories/:id' => 'categories#show', as: 'show_category'
  get '/categories/edit/:id' => 'categories#edit', as: 'edit_category'
  put '/categories/update' => 'categories#update', as: 'update_category'
  delete '/categories/delete/:id' => 'categories#delete', as: 'delete_category'

  root 'tasks#today'
  get '/tasks' => 'tasks#index'
  get '/tasks/today' => 'tasks#today', as: 'today_task'
  get '/tasks/new' => 'tasks#new', as: 'new_task'
  post '/tasks/create' => 'tasks#create', as: 'create_task'
  get '/tasks/:id' => 'tasks#show', as: 'show_task'
  get '/tasks/edit/:id' => 'tasks#edit', as: 'edit_task'
  put '/tasks/update' => 'tasks#update', as: 'update_task'
  delete '/tasks/delete/:id' => 'tasks#delete', as: 'delete_task'

  # resources :categories do
  #   resources :tasks
  # end
  
end
