class Disc < ApplicationRecord
  has_many :disc_artists
  has_many :artists, through: :disc_artists

  has_many :disc_genres
  has_many :genres, through: :disc_genres

  has_many :disc_tracks
  has_many :tracks, through: :disc_tracks

  has_many :disc_styles
  has_many :styles, through: :disc_styles


  validates :title, presence: true, length: { in: 1..60 }
  
  validates :release, presence: true, numericality: { 
                                                  greater_than_or_equal_to: 1600, 
                                                 less_than_or_equal_to: Time.now.strftime("%Y").to_i,
                                                only_integer: true
                                                 }

  validates :code, presence: true, uniqueness: true

  validates :value, presence: true, numericality: {
                                                 greater_than_or_equal_to: 1,
                                                 less_than: 1000,
                                                 }

 

  validates :label, presence: true, length: { in: 2..35 }

  validates :format, presence: true, length: { in: 2..12 }

  validates :country, presence: true, length: { in: 2..45 }
  
end
