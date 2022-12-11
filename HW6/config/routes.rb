Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :articles do
        resources :comments
      end
    end
  end
end
