# Discotroc

Discotroc est un site à but non-lucratif. Il connecte les utilisateurs entre eux dans le but d’échanger des vinyles, et de partager leur passion des disques et de la musique.

Discotroc ne dispose pas de moyen de paiement, la seule monnaie est l'échange !

C'est avant tout une communauté de passionnés qui veulent échanger leurs disques. Il est aussi possible de soumettre des articles et playlists afin de partager ses coups de cœur.

Au travers d'articles et playlists, les membres de la communauté font découvrir leurs pépites. Aussi si vous n'avez pas d'idée précise, vous pouvez tout simplement chercher parmi les disques disponibles à l'échange.

## Parcours Utilisateur

[img]: https://media.lactualite.com/2016/06/Vinyle-768x432.jpg "Super vinyle"

Reference-style:
![alt text][img]

## Installation

- Avoir un super ordinateur
- cette application fonctionne avec Ruby 2.7.1
- Faire fonctionner rails 6.0.3

bundle install
rails db:create db:migrate db:seed
rails s

```

## Fonctionnalités déjà implémentées

- Créer, voir et modifier un profil
- Poster et voir un ou plusieurs vinyles
- Rechercher un deal
- Créer et participer à un deal
- Mener à bien un échange entre deux utilisateurs
- Recevoir un email de changement de mot de passe
- Recevoir un email lors de la création d'un deal
- API Discogs
- Devise
- Active Storage
- dashboard administrateur

| /                     | Visiteur | Utilisateur connecté | Utilisateur confirmé |
| --------------------- | -------- | -------------------- | -------------------- |
| _S'inscrire_          | Oui      | /                    | /                    |
| _Se connecter_        | Oui      | Oui                  | Oui                  |
| _Modifier son profil_ | Non      | Oui                  | Oui                  |
| _Voir les vinyles_    | Oui      | Oui                  | Oui                  |


## La fameuse application !

[Discotroc !](https://discotroc-dev.herokuapp.com/)

parcours admin
- email : discotroc@yopmail.com
- mot de passe : THPdiscoTROC3483

```
