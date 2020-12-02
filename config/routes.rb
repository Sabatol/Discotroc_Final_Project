Rails.application.routes.draw do

  root 'home#index'
  devise_for :users

  resources :discs
  resources :genres
  resources :tracks
  resources :artists
  resources :styles
end
