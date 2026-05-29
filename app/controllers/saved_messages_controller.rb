class SavedMessagesController < ApplicationController
  def index
    @saved_messages = current_user.saved_chat_messages.includes(:chat, :news_item)
  end

  def create
    message = Message.find(params[:message_id])
    if current_user.saved_messages.create(message_id: message.id)
      redirect_to chat_path(message.chat), notice: "Fact-check sauvegardé !"
    else
      redirect_to chat_path(message.chat), alert: "Impossible de sauvegarder."
    end
  end

  def destroy
    if current_user.saved_messages.find(params[:id]).destroy
      redirect_back fallback_location: root_path, flash: { success: "Message supprimé de vos sauvegardes." }
    else
      redirect_back fallback_location: root_path, flash: { error: "Impossible de supprimer le message." }
    end
  end
end
