Rails.application.routes.draw do
  resources :users do
    resources :raves
  end
  resources :artists do
    resources :songs
  end
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]  
    
    root 'welcome#home' 
end