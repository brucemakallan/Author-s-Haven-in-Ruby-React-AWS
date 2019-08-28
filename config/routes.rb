Rails.application.routes.draw do
  devise_for :users

  root to: "api/v1/articles#index"

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
end
