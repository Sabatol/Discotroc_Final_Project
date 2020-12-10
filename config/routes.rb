Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :users do
    resources :user_libraries, except: %i[index show]

    resources :avatars, only: %i[create]
  end

  resources :user_libraries, only: %i[index show] do
    resources :deals, except: %i[index] do
      resources :comments, only: %i[new create destroy], path: 'Bibliothèques'
      resources :deal_contents
      resources :deal_pms
    end
  end
  resources :deals, only: %i[index]

  resources :discs
  resources :genres
  resources :formats
  resources :articles
  resources :messages, only: %i[new create], path: 'contactez-nous'
end
