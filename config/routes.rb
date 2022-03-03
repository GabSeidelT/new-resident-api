Rails.application.routes.draw do
  resource :users, only: [:create]

  post '/login', to: 'users#login', as: 'user_login'
  get '/login', to: 'users#token_authenticate', as: 'user_auth'
  post '/register', to: 'users#create', as: 'user_register'  

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }


  get 'users/index', to: 'users#index', as: 'users_index'
  

  namespace :api do
    namespace :v1 do
      resources :residents
      resources :companies
      resources :bonds
      resources :reports
      get '/residents_total', to: 'residents#total', as: 'residents_total'
      get '/companies_cordinates', to: 'companies#companies_cordinates', as: 'companies_cordinates'
    end
  end
  
end
