class DealContent < ApplicationRecord

    belongs_to :sender, class_name: "UserLibrary", foreign_key: "sender_library_id"
    belongs_to :receiver, class_name: "UserLibrary", foreign_key: "receiver_library_id"

end
