class DealPm < ApplicationRecord
    belongs_to :deal

    belongs_to :pm_author, class_name: "User", foreign_key: "pm_author_id"
end
