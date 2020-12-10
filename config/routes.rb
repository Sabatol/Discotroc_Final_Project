Rails.application.routes.draw do

  root 'home#index'
  devise_for :users


  resources :users do
    resources :user_libraries, except: [:index, :show]
    resources :avatars, only: [:create]
  end


  resources :user_libraries, only: [:index, :show] do
    resources :deals, except: [:index] do
      resources :comments, only: [:new, :create, :destroy]
      resources :deal_contents
      resources :deal_pms
    end
  end
  resources :deals, only: [:index]

  resources :discs
  resources :genres
  resources :formats
  resources :articles


end
