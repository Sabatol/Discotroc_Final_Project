class DiscTrack < ApplicationRecord
  belongs_to :track
  belongs_to :disc
  validates :track, presence: true
  validates :disc, presence: true
  
end
