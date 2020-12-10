class MessagesController < ApplicationController
  def new
    @message = Message.new
    puts
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact_email_from_user(@message).deliver_now
      redirect_to new_message_path
      flash[:notice] = "Nous avons bien reçu votre message, nous vous contacterons bientôt en retour !"
    else
      redirect_to new_message_path
      flash[:notice] = "Une erreur est survenue au moment d'envoyer votre message, veuillez essayer à nouveau."
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
