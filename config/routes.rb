Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :users do
    resources :raves
  end
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]  
    root 'welcome#home' 
end