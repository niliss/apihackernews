Rails.application.routes.draw do

  root 'articles#index'
  
  namespace :api do
    namespace :v1 do
      resources :users, :articles, :comments
    end
  end

  get "users/index"
  get "articles/index"

end
