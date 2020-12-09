# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

genres = ["Disco", "Musiques Electroniques", "Hip-Hop", "Jazz", "Soul", "Funk", "Rock", "World", "Classique", "Pop", "Variété", "Blues", "Reggae"]
genres.each do |name|
   Genre.create(name: name) 
end

5.times do
   Format.create(name: Faker::Music.band) 
end

  # Alpha_disc creation for user_controller => method: update
  Disc.create(
    title: "Veuillez choisir un disque à échanger",
    release: 2020,
    label: 'THP prod',
    country: 'France',
    artist: "Equipe THP vocal 1",
    genre: Genre.first,
    format: Format.first
  )
  10.times do
  Disc.create(
    title: Faker::Music.album,
    release: rand(1940..2020),
    label: 'PROUTPROUT',
    country: 'France',
    artist: "je suis un artiste",
    genre: Genre.all.sample,
    format: Format.all.sample
  )
  end


10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'Cacaboudin',
    password_confirmation: 'Cacaboudin',
    address: Faker::Address.street_address,
    additional_address: Faker::Address.secondary_address,
    zipcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    description: 'proutproutpouet'
  )
end

i = 0
n = 0
15.times do
  i = rand(4..10)
  UserLibrary.create(
    user_id: User.ids[n],
    disc_id: Disc.ids[i],
    description: Faker::Lorem.sentence(word_count: i)
  )
  if i < Disc.count
    i += 1
  else
    i = 0
  end
  if n < User.count
    n += 1
  else
    n = 0
  end
end

8.times do
  Deal.create(sender_id: User.ids.sample, receiver_id: User.ids.sample)
end

12.times do
  DealContent.create(
    deal_id: Deal.ids.sample,
    sender_library_id: UserLibrary.ids.sample,
    receiver_library_id: UserLibrary.ids.sample
  )
end

12.times do
  DealPm.create(
    deal_id: Deal.ids.sample,
    pm_author_id: User.ids.sample,
    content: 'Bonjour, je suis très interessé!'
  )
end
n = 0
25.times do
  Article.create(
    user_id: User.ids[n],
    title: Faker::Lorem.sentence,
    content:
      "Tabarouette de mosus de cibolac de calvinouche de tabarnane de crucifix de purée de sacréfice de bout d'viarge de sacrament de patente à gosse de câlisse d'astie de calvaire de cimonaque de maudit de cochonnerie de verrat de mangeux d'marde de colon de bâtard de cibole de crime de viande à chien de cul d'enfant d'chienne d'étole de calvince de saintes fesses de baptême de charogne de saint-sacrament de batince de ciarge de tabarslaque de ciboire de sacristi de cibouleau de tabarnak de charrue."
  )
  if n < User.count
    n += 1
  else
    n = 0
  end
end


n = 0
i = 1
15.times do
  Comment.create(comment_sender_id: User.ids[n], comment_receiver_id: User.ids[i], deal_id: Deal.ids[n], content: "Tabarnac de mosus de cibolac de calvinouche de tabarnane de crucifix de purée de sacréfice de bout d'viarge de sacrament de patente à gosse de câlisse d'astie de calvaire de cimonaque de maudit de cochonnerie de verrat de mangeux d'marde de colon de bâtard de cibole de crime de viande à chien de cul d'enfant d'chienne.")
  if n < User.count
    n += 1
  else
    n = 0
  end
  if i < User.count
    i+=1
  else 
    i=0
  end
end
