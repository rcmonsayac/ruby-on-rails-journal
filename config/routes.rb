Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/categories' => 'categories#index'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories/create' => 'categories#create', as: 'create_category'
  get '/categories/:id' => 'categories#show', as: 'show_category'
  get '/categories/edit/:id' => 'categories#edit', as: 'edit_category'
  put '/categories/update' => 'categories#update', as: 'update_category'
  delete '/categories/delete/:id' => 'categories#delete', as: 'delete_category'
end
