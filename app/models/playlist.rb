class Playlist < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1...35 }
end
