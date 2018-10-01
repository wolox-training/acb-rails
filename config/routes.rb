Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(:module => "Api::V1", :path => {:value => "api/v1"}) do
    resources :books, only: [:index,:show]
    resources :rents, only: [:create, :index]
  end
end
