class MessagesController < ApplicationController
  SYSTEM_PROMPT = "You are a journalist, expert about sciences, politics, history.\n\nI am a user a bit lost about some news, what sources are reliable, what to trust.\n\nHelp me understand if the info I'm sharing with you is trustworthy or not. Insert a % of reliability of the info. Insert sources.\n\nAnswer concisely in Markdown."

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"
    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
