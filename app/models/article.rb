class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...35 }
  validates :content, presence: true, length: { in: 5...1500 }
end
