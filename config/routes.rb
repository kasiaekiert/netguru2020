Rails.application.routes.draw do
  resources :comments
  devise_for :users

  root "home#welcome"
  get '/topcommentators', to: 'static_pages#topcommentators'
  resources :movies_apis
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
end
