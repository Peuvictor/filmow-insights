Rails.application.routes.draw do
  get 'movies/index'
  root "movies#index"
  resources :movies, only: [:index, :create]
end
