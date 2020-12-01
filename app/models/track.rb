class Track < ApplicationRecord
  has_many :disc_tracks, dependent: :destroy 
  has_many :discs, through: :disc_tracks
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...100 }
  end
  