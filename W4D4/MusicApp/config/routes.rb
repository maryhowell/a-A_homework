Rails.application.routes.draw do
  resource :user, only: [:create, :new, :show]
  resource :session, only: [:create, :destroy, :new]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :edit, :show, :update] do
    resources :tracks, only: [:new]
  end

   resources :tracks, only: [:create, :destroy, :edit, :show, :update]

  resources :notes, only: [:create, :destroy]

end
