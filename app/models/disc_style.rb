class DiscStyle < ApplicationRecord
  belongs_to :style
  belongs_to :disc
  validates :style, presence: true
  validates :disc, presence: true
end
