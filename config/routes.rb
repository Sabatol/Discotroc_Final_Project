Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

<<<<<<< HEAD
  resources :users do
    resources :user_libraries, except: %i[index show]
  end

  resources :user_libraries, only: %i[index show] do
    resources :deals, except: %i[index] do
      resources :comments, only: %i[new create destroy]
      resources :deal_contents
      resources :deal_pms
    end
  end
  resources :deals, only: %i[index]

  resources :discs
  resources :genres
  resources :formats
  resources :articles
  resources :messages, only: %i[new create]
=======
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
>>>>>>> d593b00eec28132fb17c8ac03f59f8e5ba25d883
end
