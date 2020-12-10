Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path: 'Utilisateur'

  resources :users, path: 'Utilisateur' do
    resources :user_libraries, except: %i[index show], path: 'Bibliothèques'

    resources :avatars, only: %i[create]
  end

  resources :user_libraries, only: %i[index show], path: 'Bibliothèques' do
    resources :deals, except: %i[index], path: 'Echange' do
      resources :comments, only: %i[new create destroy], path: 'Bibliothèques'
      resources :deal_contents, path: 'Proposition'
      resources :deal_pms, path: 'Message-privé'
    end
  end
  resources :deals, only: %i[index], path: 'Troc'

  resources :discs, path: 'Disques'
  resources :genres
  resources :formats
  resources :articles
  resources :messages, only: %i[new create], path: 'Contactez-nous'
end
