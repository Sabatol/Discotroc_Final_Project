class Deal < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"

    validates :receiver_ok?, presence: true
    validates :sender_ok?, presence: true
  
    

end
