class Disc < ApplicationRecord
  belongs_to :format
  belongs_to :genre

  has_many :user_libraries, dependent: :destroy 
  has_many :users, through: :user_libraries

  validates :artist, presence: true, length: { in: 1..65 }

  validates :title, presence: true, length: { in: 1..65 }
  
  validates :release, presence: true, numericality: { 
                                                  greater_than_or_equal_to: 1600, 
                                                 less_than_or_equal_to: Time.now.strftime("%Y").to_i,
                                                only_integer: true
                                                 }

  validates :label, presence: true, length: { in: 2..35 }

  validates :country, presence: true, length: { in: 2..45 }

  validates :format, presence: true

  validates :genre, presence: true
  
end
