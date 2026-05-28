class MessagesController < ApplicationController

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)

      @assistant_message = @chat.messages.create(assistant_attributes_from(response.content))
      @chat.generate_title_from_first_message

      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def assistant_attributes_from(raw)
    cleaned = raw.to_s.strip.sub(/\A```(?:json)?\s*/i, "").sub(/```\s*\z/, "")
    parsed = JSON.parse(cleaned)

    {
      role: "assistant",
      content: parsed["content"].to_s,
      verdict: parsed["verdict"],
      truth_percentage: parsed["truth_percentage"],
      confidence_level: parsed["confidence_level"],
      name: parsed["name"],
      category: parsed["category"],
      tags: Array(parsed["tags"]).first(5),
      origin: parsed["origin"]
    }
  rescue JSON::ParserError
    {
      role: "assistant",
      content: raw.to_s,
      verdict: "NON VÉRIFIABLE",
      truth_percentage: 0,
      confidence_level: "Faible",
      name: nil,
      category: nil,
      tags: [],
      origin: nil
    }
  end
end
