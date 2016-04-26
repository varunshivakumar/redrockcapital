SampleApp::Application.routes.draw do
  #resources :users do
    #member do
      #get :following, :followers
    #end
  #end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :users
  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  ### Client Page ###
  get '/home', to: 'clients#home'
  get '/orders/:id', to: 'clients#orders', as: 'orders'


  # get '/clienthome/:id', to: 'clients#index', as: 'clienthome'
  # match '/orders', to: 'clients#orders', via: 'get'

end