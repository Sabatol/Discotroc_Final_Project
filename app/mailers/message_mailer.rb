class MessageMailer < ApplicationMailer
  def contact_email_from_user(message)
    @message = message
    mail(
      to: 'disco@yopmail.com',
      subject: 'Un utilisateur de teach-peach vous a envoyé un message..'
    )
  end
end
