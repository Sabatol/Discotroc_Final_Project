# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# Create genre of music for filter
genres = %w[
  Disco
  Electronique
  Hip-Hop
  Jazz
  Soul
  Funk
  Rock
  World
  Classique
  Pop
  Variété
  Blues
  Reggae
]
genres.each { |name| Genre.create(name: name) }

formats = ['Vinyle 33T', 'Vinyle 45T', 'Vinyl 78T', 'CD', 'LaserDisc', 'Blue-Ray BDA', 'Dual Disc', 'DVD-A']
formats.each { |name| Format.create(name: name) }

# Alpha_disc creation for user_controller => method: update    *Alpha_disc is the first disc of the table and we use it for selector in deal_show      
Disc.create(
  title: 'Veuillez choisir un disque à échanger',
  release: 2020,
  label: 'THP prod',
  country: 'France',
  artist: 'DiscoTroc',
  genre: Genre.all.sample,
  format: Format.all.sample
)

10.times do
  Disc.create(
    title: Faker::Music.album,
    release: rand(1940..2020),
    label: 'Nu Guinea',
    country: 'France',
    artist: Faker::Music.band,
    genre: Genre.all.sample,
    format: Format.all.sample
  )
end


User.create(
  first_name: 'DiscoTroc',
  last_name: 'Admin',
  email: 'discotroc@yopmail.com',
  password: 'THPdiscoTROC3483',
  password_confirmation: 'THPdiscoTROC3483',
  address: "83, Boulevard Macdonald",
  additional_address: "Discotroc",
  zipcode: 75019,
  city: "Paris",
  country: 'France',
  description: "Compte Admin",
  completed: true,
  is_admin?: true
)

9.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    address: Faker::Address.street_address,
    additional_address: Faker::Address.secondary_address,
    zipcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    description: Faker::Lorem.sentence(word_count: rand(5..15)),
    completed: true,
    is_admin?: false
  )
end

# Create first user_library alpha_disc for each user    *Alpha_disc is the first disc of the table and we use it for selector in deal_show 
i = 0
10.times do
  UserLibrary.create(disc_id: Disc.ids[0], description: "Ce disque n'est pas sensé apparaître, merci de contacter les administrateurs du site à ce sujet si vous voyez ce message.", user_id: users[i])
  i += 1
end


n = 0
15.times do
  i = rand(1..10)
  UserLibrary.create(
    user_id: User.ids[n],
    disc_id: Disc.ids[i],
    description: Faker::Lorem.sentence(word_count: rand(2..10))
  )
  if n < User.count
    n += 1
  else
    n = 0
  end
end


x = 0
y = 1
z = 2
8.times do
Deal.create(sender_id: User.ids[y], receiver_id: User.ids[z])

  DealContent.create(
    deal_id: Deal.ids[x],
    sender_library_id: Deal.ids[x]nder.user_library_ids.sample,
    receiver_library_id: Deal.ids[x]ceiver.user_library_ids.sample
  )

  2.times do
    Comment.create(
      comment_sender_id: User.ids[y],
      comment_receiver_id: User.ids[z],
      deal_id: Deal.ids[x],
      content: Faker::Lorem.sentence(word_count: rand(3..15))
    )
  end

  2.times do
    DealPm.create(
      deal_id: Deal.ids[x],
      pm_author_id: User.ids[y],
      content: Faker::Lorem.sentence(word_count: rand(3..12))
    )
    DealPm.create(
      deal_id: Deal.ids[x],
      pm_author_id: User.ids[z],
      content: Faker::Lorem.sentence(word_count: rand(3..12))
    )
  end

  x += 1
  y += 1
  z += 1
end


n = 0
25.times do
  Article.create(
    user_id: User.ids[n],
    title: Faker::Lorem.sentence,
    content:Faker::Lorem.sentence(word_count: rand(3..15))
  )
  if n < User.count
    n += 1
  else
    n = 0
  end
end
