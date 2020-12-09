Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :deals do
    resources :comments, only: %i[new create destroy]
    resources :deal_contents
    resources :deal_pms
  end

  resources :users do
    resources :user_libraries, except: %i[index show]
  end
  resources :user_libraries, only: %i[index show]
  resources :discs
  resources :genres
  resources :tracks
  resources :artists
  resources :styles
  resources :disc_states
  resources :contacts, only: %i[new create]
  resources :articles
end
