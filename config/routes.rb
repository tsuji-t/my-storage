Rails.application.routes.draw do
  devise_for :users
  root "words#index"
  resources :users, only: :show
  resources :words do
    collection do
      get 'search'
    end
  end
end
