class UserMailer < ApplicationMailer
  def send_message_new_user(user)
    @user = user
    @url = 'https://discotroc.herokuapp.com/'
    mail(to: @user.email, subject: 'Vous vous êtes inscrit sur Discotroc !')
  end
end
