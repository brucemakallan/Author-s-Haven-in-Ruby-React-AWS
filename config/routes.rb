Rails.application.routes.draw do
  root to: 'application#hello'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles
      resources :users, only: [:create]
      resources :auth, only: [:create]
    end
  end
end
