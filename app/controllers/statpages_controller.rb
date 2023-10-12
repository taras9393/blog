class StatpagesController < ApplicationController

  def home
    @articles = Article.published.sort_by_likes_count
  end

end
