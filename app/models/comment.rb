class Comment < ApplicationRecord
  belongs_to :deal 
  belongs_to :comment_sender, class_name: 'User', foreign_key: 'comment_sender_id'
  belongs_to :comment_receiver, class_name: 'User', foreign_key: 'comment_receiver_id'
end
