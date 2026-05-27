class NewsController < ApplicationController
  def index
    @news = News.where(trending: true).limit(4)
  end
end
