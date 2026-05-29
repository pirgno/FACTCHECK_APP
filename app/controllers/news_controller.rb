class NewsController < ApplicationController
  def index
    @news = News.where(trending: true).order("RANDOM()").limit(4)
    @saved_messages = current_user.saved_messages
  end

  def show
    @news = News.find(params[:id])
  end
end
