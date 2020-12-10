class MessageMailer < ApplicationMailer
  default to: 'disco@yopmail.com'
  def contact_email_from_user(message)
    @message = message
    mail(from: @message.email, body: @message.body)
  end
end
