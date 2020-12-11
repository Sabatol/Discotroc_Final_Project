Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :genres
      resources :articles
      resources :deals
      resources :deal_pms
      resources :discs
      resources :user_libraries
      resources :formats
      resources :comments
      resources :deal_contents

      root to: "users#index"
    end
  root 'home#index'
  devise_for :users, path: 'utilisateur'

  resources :users, path: 'utilisateur' do
    resources :user_libraries, except: %i[index show], path: 'bibliothèques'

    resources :avatars, only: %i[create]
  end

  resources :user_libraries, only: %i[index show], path: 'bibliothèques' do
    resources :deals, except: %i[index], path: 'Echange' do
      resources :comments, only: %i[new create destroy], path: 'bibliothèques'
      resources :deal_contents, path: 'proposition'
      resources :deal_pms, path: 'message-privé'
    end
  end
  resources :deals, only: %i[index], path: 'troc'

  resources :discs, path: 'disques'
  resources :genres
  resources :formats
  resources :articles
  resources :messages, only: %i[new create], path: 'contactez-nous'
end
