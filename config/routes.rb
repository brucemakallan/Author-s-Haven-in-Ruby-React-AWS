Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :articles
      resources :sessions, only: [:create, :destroy]
    end
  end
end
