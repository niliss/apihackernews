 Rails.application.routes.draw do

  root 'articles#index'
  
  namespace :api do
    namespace :v1 do
      resources :articles, :comments
      resources :users do
        get "tokens" => "users#create_token"
      end
    end
  end

  get "users/index"
  get "articles/index"

  # resources :users
  # resources :articles

end
