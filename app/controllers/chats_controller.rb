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

def create
  @chat = Chat.new(title: "Untitled")
  response = RubyLLM.chat.with_instructions(instructions).ask(@message.content)
  Message.create(role: "assistant", content: response.content, chat: @chat)
  @chat.generate_title_from_first_message
  @chat.user = current_user
end
