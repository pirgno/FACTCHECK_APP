class NewsController < ApplicationController
  def index
    @news = News.where(trending: true).limit(4)
    @saved_messages = current_user.saved_chat_messages
  end
end
