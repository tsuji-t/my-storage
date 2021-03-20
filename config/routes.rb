Rails.application.routes.draw do
  devise_for :users
  root "words#index"
  resources :users, only: :show
  resources :words do
    resources :comments, only: :create
    resources :favarotes, only: [:create, :show, :destroy]
    collection do
      get 'search'
    end
  end
end
