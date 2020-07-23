Rails.application.routes.draw do
  resources :users, except: [:index] 
  
  resources :raves do 
   resources :artists, only: [:new, :create, :show] 
  end
    resources :stages
    get '/artists/search', to: 'artists#search'
    get '/artists/search/results', to: 'artists#index'
    resources :artists


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # get '/deleteRave', to: 'raves#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
    
  root 'welcome#home' 
end