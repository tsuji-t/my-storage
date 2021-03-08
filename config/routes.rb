Rails.application.routes.draw do
  devise_for :users
  root "words#index"
  resources :words, only: :index
end
