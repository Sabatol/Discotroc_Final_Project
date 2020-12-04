class DealMailer < ApplicationMailer
  def send_message_new_deal
    @sender = User.find(@new_deal.sender_id)
    @receiver = User.find(@new_deal.receiver_id)

    @url = "https://discotroc-dev.herokuapp.com/deals/#{@new_deal.id}"
    mail(to: @sender.email,@receiver.email, subject: 'Vous vous êtes inscrit sur Discotroc !')
  end
end
