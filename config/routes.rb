Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :books, only: %i[index show]
    resources :rents, only: %i[create index]
  end
end
