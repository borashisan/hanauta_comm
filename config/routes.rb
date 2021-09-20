Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'users#new'
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :microposts,  only: [:show, :create, :destroy] do
    resources :responses, only: [:create, :destroy]
  end
  resources :account_activations, only: [:edit]
end
