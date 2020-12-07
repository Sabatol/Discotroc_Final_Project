# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Artist.destroy_all
Genre.destroy_all
Style.destroy_all
Track.destroy_all
Deal.destroy_all
User.destroy_all
Article.destroy_all
Disc.destroy_all
Comment.destroy_all

randomizer = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + %w[_ - .]

format = ['CD', '33 tours', '45 tours', 'LaserDisc', 'HDCD']

5.times { Artist.create(name: Faker::Music.band) }

5.times { Genre.create(name: Faker::Music.genre) }

5.times { Style.create(name: Faker::Music.instrument) }

60.times { Track.create(name: Faker::Music.chord) }

10.times do
  reference = ''
  15.times { reference += randomizer[rand(randomizer.size)].to_s }

  Disc.create(
    title: Faker::Music.album,
    release: rand(1940..2020),
    label: 'PROUTPROUT',
    code: reference,
    value: rand(1..1000),
    format: format[rand(0..4)],
    country: 'France'
  )
end

i = 0
12.times do
  DiscArtist.create(artist_id: Artist.ids.sample, disc_id: Disc.ids[i])
  if i < Disc.count
    i += 1
  else
    i = 0
  end
end

i = 0
15.times do
  DiscStyle.create(style_id: Style.ids.sample, disc_id: Disc.ids[i])
  if i < Disc.count
    i += 1
  else
    i = 0
  end
end

i = 0
70.times do
  DiscTrack.create(track_id: Track.ids.sample, disc_id: Disc.ids[i])
  if i < Disc.count
    i += 1
  else
    i = 0
  end
end
i = 0
15.times do
  DiscGenre.create(genre_id: Genre.ids.sample, disc_id: Disc.ids[i])
  if i < Disc.count
    i += 1
  else
    i = 0
  end
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

states = ['neuf', 'moyen', 'pas ouf', 'naze']
coeff = [1, 0.75, 0.5, 0.25]
n = 0
states.each do |state_name|
  DiscState.create(name: state_name, coefficient: coeff[n])
  n += 1
end

i = 0
n = 0
15.times do
  i = rand(4..10)
  UserLibrary.create(
    user_id: User.ids[n],
    disc_id: Disc.ids[i],
    disc_state_id: DiscState.ids.sample,
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
25.times do
  Playlist.create(user_id: User.ids[n], title: Faker::Music.album)
  if n < User.count
    n += 1
  else
    n = 0
  end
end
n = 0
9.times do
  Comment.create(sender_id: User.ids[n], receiver_id: User.ids[User.count - n], deal_id: Deal.ids[n], content: "Tabarnac de mosus de cibolac de calvinouche de tabarnane de crucifix de purée de sacréfice de bout d'viarge de sacrament de patente à gosse de câlisse d'astie de calvaire de cimonaque de maudit de cochonnerie de verrat de mangeux d'marde de colon de bâtard de cibole de crime de viande à chien de cul d'enfant d'chienne.")
    n += 1
end
