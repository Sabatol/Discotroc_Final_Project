class DiscArtist < ApplicationRecord
  belongs_to :artist
  belongs_to :disc
  validates :artist, presence: true
  validates :disc, presence: true


end
