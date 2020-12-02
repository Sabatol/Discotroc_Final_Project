class Deal < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

    has_many :deal_contents

    has_many :deal_pms


end
