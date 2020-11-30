class UserLibrary < ApplicationRecord
belongs_to :user
belongs_to :disc
belongs_to :disc_state

validates :user, presence: true
validates :disc, presence: true
validates :disc_state, presence: true
validates :description, length: { in: 4..240 }


end
