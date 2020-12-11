Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path: 'utilisateur'

  resources :users, path: 'utilisateur' do
    resources :user_libraries, except: [:index, :show], path: 'bibliothèques'

    resources :avatars, only: [:create]
  end

  resources :user_libraries, only: [:index, :show], path: 'bibliothèques' do
    resources :deals, except: [:index, :new, :edit], path: 'Echange' do
      resources :comments, only: [:new, :create, :destroy], path: 'bibliothèques'
      resources :deal_contents, only: [:create, :update, :destroy], path: 'proposition'
      resources :deal_pms, only: [:create], path: 'message-privé'
    end
  end
  resources :deals, only: [:index], path: 'troc'

  resources :discs, path: 'disques'
  resources :genres, only: [:create, :update, :destroy]
  resources :formats
  resources :articles
  resources :messages, only: [:new, :create], path: 'contactez-nous'
end
