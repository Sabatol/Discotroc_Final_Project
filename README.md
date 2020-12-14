# DiscoTroc


![alt text][img]


[DiscoTroc](https://discotroc-dev.herokuapp.com/) is a non-profit site. It connects users with each other for the purpose of exchanging records, and sharing their passion for records and music.

DiscoTroc does not have a means of payment, only the exchange!

It is above all a community of enthusiasts and connoisseurs who want to exchange their musical nuggets. It is also possible to submit articles in order to share your favorites, rants, etc.

### User Browsing

A user named "felix" searches on google for a site which would allow him to get rid of his old discs and discover others at a lower cost.
After a brief search on google.com, he clicks on the link leading to the DiscoTroc application.

After seeing the hompage he understands that he has to create a user account to offer his old records.

He searches in our database, and after having found 2 of the 3 discs that he will offer for exchange, he understands that the third one does not yet exist and he decides to register it on the site.
After entering some information, our application will find for him the most appropriate cover image for his disc.

A few days later he receives an email informing him that someone is interested in his record. after some discussions he concludes an agreement.
Users will finalize the exchange by post


[img]: https://media.lactualite.com/2016/06/Vinyle-768x432.jpg "Super vinyle"

## Developpement  

### How to Install

This app is created with Ruby 2.7.1 in Rails 6 (PostGresQL).

(You need to have a linux environnement like WSL, MacOS or a distro like Ubuntu or others)

For LocalHost Server
- Clone or download this repository
- Go in the folder's app with you terminal (check the path) and run this command :
```ruby
$ bundle install

$ rails db:create
$ rails db:migrate
$ rails db:seed

```
 And now you can run 
```ruby
$ rails s
```
enjoy !

You can also use the BuildIn Console with the command
```ruby
$ rails c
```

## Somes Features
- Create, view and modify a profile
- Post and view one or more vinyls
- Find a deal
- Create and participate in a deal
- Find Cover picture automaticly (Powered by Discogs)
- Carry out an exchange between two users
- Mailer (register confirmation, forgotten password, Deal confirmed, contact us)
- Currency
- Active Storage

etc...

### Users Permissions

|                       | Visitor  |    Connected User    |   Confirmed User     |
| --------------------- | -------- | -------------------- | -------------------- |
| _Sign Up_             | Yes      |      ----------      |      ----------      |
| _Sign In_             |   ----   | Yes                  | Yes                  |
| _Edit Profil_         | No       | Yes                  | Yes                  |
| _Look at Discs_       | Yes      | Yes                  | Yes                  |
| _Make A Deal_         | No       | Yes                  | Yes                  |

## The Team 

This project was made in 2 weeks and updated by the "Vocal ONE" Team of the BootCamp "The Hacking Project".

- Chris Boyer (ChriZoizo)
- Florian Empinet (FlorianE-THP)
- Jonathan Bouillaux (Piwiit)
- Ugo Sacrez (Sabatol)
- Killian Kos (Kill84)

# Heroku Link


the following link open the Production Application Hosted by Heroku :
[DiscoTroc](https://discotroc-dev.herokuapp.com/)