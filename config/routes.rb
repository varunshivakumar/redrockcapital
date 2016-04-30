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
  get '/client/:id', to: 'clients#show', as: 'client'           # Clients show page
  get '/client/:id/orders', to: 'clients#orders', as: 'orders'  # Clients orders page

  ### Stocks Controller ###
  get '/stocks', to: 'stocks#stocks', as: 'stocks'              # See all/ Search for stocks
  resources :stocks, param: :name, only: [:show]                # Stocks show page

  ### Employees Controller ###
  get '/employee/:id', to: 'employees#employee_home' , as: 'employee'
  get '/manager/:id', to: 'employees#manager_home', as: 'manager'
end