Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :artists do
    resources :song
  end
end
