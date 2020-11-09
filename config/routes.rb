Rails.application.routes.draw do
  # get 'sessions/new'
  resources :blogs
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
end
