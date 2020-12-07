class Deal < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  has_many :deal_contents, dependent: :destroy
  has_many :deal_pms, dependent: :destroy

  has_many :comments

  after_create :send_deal_email
  def send_deal_email
    DealMailer.send_message_new_deal_receiver(self).deliver
    DealMailer.send_message_new_deal_sender(self).deliver
  end
end
