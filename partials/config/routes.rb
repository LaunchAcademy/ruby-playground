Rails.application.routes.draw do
  root 'movies#index'
  resources :movies, only: [:index, :show] do
    resources :rentals, only: [:create]
  end
end
