class Artist < ApplicationRecord
  has_many :disc_artists, dependent: :destroy 
  has_many :discs, through: :disc_artists
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...80 }
  
end
