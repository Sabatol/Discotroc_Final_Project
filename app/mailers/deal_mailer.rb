class DealMailer < ApplicationMailer
  def send_message_new_deal_receiver(deal)
    @new_deal = deal
    @receiver = User.find(@new_deal.receiver_id)
    @url = "https://discotroc.herokuapp.com/Echange/#{@new_deal.id}"
    mail(to: @receiver.email, subject: 'Nouveau deal initié !')
  end

  def send_message_new_deal_sender(deal)
    @new_deal = deal
    @sender = User.find(@new_deal.sender_id)
    @url = "https://discotroc.herokuapp.com/Echange/#{@new_deal.id}"
    mail(to: @sender.email, subject: 'Nouveau deal initié !')
  end
end
