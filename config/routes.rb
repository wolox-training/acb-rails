Rails.application.routes.draw do

  match 'login', to: redirect('/auth/google_oauth2'), as: 'login' , via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create' , via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')

=begin
  post 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  post 'signout', to: 'sessions#destroy', as: 'signout'
  post 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/failure', to: redirect('/')
=end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount_devise_token_auth_for 'User', at: 'auth',:controllers => { :omniauth_callbacks => 'omniauth' }, via: [:get, :post]
  #mount_devise_token_auth_for 'User', at: 'auth'
  # TODO
  #mount_devise_token_auth_for 'User', at: 'users/sessions'
  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :books, only: [:index, :show]
    resources :rents, only: [:create, :index]
    resources :book_suggestions, only: [:create]
  end
=begin
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
 get 'logout', to: 'sessions#destroy', as: 'logout'
 get 'auth/:provider/callback', to: 'sessions#create'
 get 'auth/failure', to: redirect('/')
 get 'home', to: 'home#show'
 get 'me', to: 'me#show', as: 'me'
=end
end
