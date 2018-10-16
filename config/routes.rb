Rails.application.routes.draw do

  get 'sessions/Controller'

  match 'login', to: redirect('/auth/google_oauth2'), as: 'login' , via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create' , via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # mount_devise_token_auth_for 'User', at: 'users/sessions'
  mount_devise_token_auth_for 'User', at: 'auth',:controllers => { :omniauth_callbacks => 'users/omniauth' }, via: [:get, :post]
  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :books, only: [:index, :show]
    resources :rents, only: [:create, :index]
    resources :book_suggestions, only: [:create]
  end
end
