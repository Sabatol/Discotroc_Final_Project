class DiscState < ApplicationRecord
has_many :user_libraries

validates :name, presence: true, uniqueness: true
validates :coefficient, presence: true, uniqueness: true, numericality: {
  greater_than: 0 ,
  less_than_or_equal_to: 1 
}
end
