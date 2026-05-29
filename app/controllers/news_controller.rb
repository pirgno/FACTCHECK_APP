class NewsController < ApplicationController
  def index
    @news = News.where(trending: true).order("RANDOM()").limit(4)
  end

  def show
    @news = News.find(params[:id])
  end
end
