# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
DiscArtist.destroy_all
Artist.destroy_all
Disc.destroy_all

randomizer =("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]

format = ["CD", "33 tours", "45 tours", "LaserDisc", "HDCD" ]

5.times do 
    Artist.create(name: Faker::Music.band)
end

5.times do 
    Genre.create(name: Faker::Music.genre)
end

5.times do 
    Style.create(name: Faker::Music.instrument)
end

60.times do 
    Track.create(name: Faker::Music.chord)
end

10.times do
    reference = ""
    15.times{ reference += randomizer[rand(randomizer.size)].to_s }

    Disc.create(title: Faker::Music.album, release: rand(1940..2020), label: "PROUTPROUT", code: reference, value: rand(1..1000), format: format[rand(0..4)], country: "France")
end



12.times do
    DiscArtist.create(artist_id: Artist.ids.sample, disc_id: Disc.ids.sample)
end

10.times do
    DiscStyle.create(style_id: Style.ids.sample, disc_id: Disc.ids.sample)
end

70.times do
    DiscTrack.create(track_id: Track.ids.sample, disc_id: Disc.ids.sample)
end

10.times do
    DiscGenre.create(genre_id: Genre.ids.sample, disc_id: Disc.ids.sample)
end


10.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "Cacaboudin", password_confirmation: "Cacaboudin", address: Faker::Address.street_address, additional_address: Faker::Address.secondary_address, zipcode: Faker::Address.zip_code, city: Faker::Address.city, country: Faker::Address.country, description: "proutproutpouet")
end


states = ["neuf", "moyen", "pas ouf", "naze"]
coeff = [1, 0.75, 0.5, 0.25]
n = 0
4.times do
  DiscState.create(name: states[n], coefficient: coeff[n])
  n+=1
end

15.times do 
  i = rand(4..10)
  UserLibrary.create(user_id: User.ids.sample, disc_id: Disc.ids.sample, disc_state_id: DiscState.ids.sample, description: Faker::Lorem.sentence(word_count: i) )
end


8.times do
    Deal.create(sender_id: User.ids.sample, receiver_id: User.ids.sample)
  end