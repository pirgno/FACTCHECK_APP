class ChatsController < ApplicationController
  def create
    @chat = Chat.new(title: "Untitled")
    @chat.user = current_user
    @chat.save
    redirect_to chat_path(@chat, message: params[:message])
  end

  def show
    @chat = current_user.chats.find(params[:id])
    if params[:message]
      initialize_chat_with_message
    else
      @message = Message.new
    end
  end

  private

  def initialize_chat_with_message
    @chat = current_user.chats.find(params[:id])
    @message = Message.new(content: params[:message])
    @message.chat = @chat
    @message.role = "user"
    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      @chat.messages.create(Message.assistant_attributes_from(response.content))
      @chat.generate_title_from_first_message
      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end
end
