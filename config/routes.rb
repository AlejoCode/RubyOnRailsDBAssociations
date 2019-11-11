Rails.application.routes.draw do
  get 'events/index'
  resources :users
  root 'events#index'
  resources :events
  delete '/logout',  to: 'sessions#destroy'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post   '/attend',  to: 'attendances#create'
  get    'attendances', to: 'attendances#index'
end
