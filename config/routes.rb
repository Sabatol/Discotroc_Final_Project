Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :disc
  resources :genre
  resources :track
  resources :artist
  resources :style
end
