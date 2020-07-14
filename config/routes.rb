Rails.application.routes.draw do
  resources :users, except: [:index] do
    resources :raves
  end
  resources :artists do
    resources :songs
  end

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
  # , via: [:get, :post]  
    
  root 'welcome#home' 
end