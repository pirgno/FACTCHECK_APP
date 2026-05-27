class ChatsController < ApplicationController
  def create
    @chat = Chat.new(title: "Untitled")
    @chat.user = current_user
    @chat.save
    redirect_to chat_path(@chat)
  end
  
  def show
    @chat    = current_user.chats.find(params[:id])
    @message = Message.new
  end
end
