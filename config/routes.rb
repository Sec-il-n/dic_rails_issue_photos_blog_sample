Rails.application.routes.draw do
  root to: 'top#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
end
