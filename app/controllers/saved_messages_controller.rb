class SavedMessagesController < ApplicationController
  def index
    @saved_messages = current_user.saved_chat_messages.includes(:chat, :news_item)
  end

  def create
    @saved_message = current_user.saved_messages.new(message_id: params[:message_id])
    if @saved_message.save
      redirect_back fallback_location: root_path, success: "Message sauvegardé avec succès."
    else
      redirect_back fallback_location: root_path, alert: "Impossible de sauvegarder le message."
    end
  end

  def destroy
    @saved_message = current_user.saved_messages.find(params[:id])
    @saved_message.destroy
    redirect_back fallback_location: root_path, success: "Message supprimé de vos sauvegardes."
  end
end
