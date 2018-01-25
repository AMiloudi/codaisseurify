Rails.application.routes.draw do
  root to: 'artists#index'

  namespace :api do
    resources :artists do
      resources :songs
      resources :photos, only: [:destroy]
    end
  end
end
