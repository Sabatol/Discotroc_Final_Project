class DealMailer < ApplicationMailer
  def send_message_new_deal_receiver(deal)
    @new_deal = deal
    @receiver = User.find(@new_deal.receiver_id)
    @url = "https://discotroc.herokuapp.com/utilisateur/#{@new_deal.receiver.id}"
    mail(to: @receiver.email, subject: 'Nouveau troc')
  end

  def send_message_new_deal_sender(deal)
    @new_deal = deal
    @sender = User.find(@new_deal.sender_id)
    @url = "https://discotroc.herokuapp.com/utilisateur/#{@new_deal.sender.id}"
    mail(to: @sender.email, subject: 'Nouveau troc')
  end
end
