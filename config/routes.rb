 Rails.application.routes.draw do

  root 'articles#index'
  
  namespace :api do
    namespace :v1 do
      resources :articles, :comments
      resources :users do
        resources :tokens
      end
    end
  end

  get "users/index"
   get "articles/index"

  # resources :users
  # resources :articles

end
