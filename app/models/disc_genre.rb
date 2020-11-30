class DiscGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :disc
  validates :genre, presence: true
  validates :disc, presence: true

end
