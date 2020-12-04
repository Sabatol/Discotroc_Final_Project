class UserMailer < ApplicationMailer
  def send_message_new_user(user)
    @user = user
    @url = "google.com"
    mail(:to => @user.email, :subject => "Vous vous êtes inscrit sur Discotroc !")
  end
end
