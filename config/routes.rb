Rails.application.routes.draw do
  resources :users, except: [:index] do 
    resources :raves, only: [:new, :create, :show]
  end
  resources :artists
  resources :raves
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
    
  root 'welcome#home' 
end