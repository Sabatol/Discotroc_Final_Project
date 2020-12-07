Rails.application.routes.draw do

  root 'home#index'
  devise_for :users

  resources :users

  resources :discs
  resources :genres
  resources :tracks
  resources :artists
  resources :styles
  resources :deals
  resources :deal_contents
  resources :deal_pms
  resources :user_libraries
  resources :disc_states
  resources :articles


end
