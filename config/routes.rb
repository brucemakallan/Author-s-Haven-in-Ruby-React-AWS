Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles

      namespace :users do
        resources :users, only: [:create]
      end
    end
  end
end
