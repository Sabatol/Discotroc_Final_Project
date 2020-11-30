class Style < ApplicationRecord
  has_many :disc_styles
  has_many :discs, through: :disc_styles
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...80 }
  end