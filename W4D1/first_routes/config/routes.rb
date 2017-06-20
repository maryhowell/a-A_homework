Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :only => [:create, :destroy, :index, :show, :update]
  resources :artworks, :only => [:create, :destroy, :index, :show, :update]
  # get '/users', to: 'users#index'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users', to: 'users#show'
  # get '/users/*other', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # put '/users/:id', to: 'users#update'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
end
