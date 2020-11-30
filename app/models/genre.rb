class Genre < ApplicationRecord
  has_many :disc_genres
has_many :genres, through: :disc_genres
validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...80 }
end
