class StatpagesController < ApplicationController

  def home
    @articles = Article.where('published_at <= ?', DateTime.now).sort_by{|a| a.get_likes.count }.reverse
  end

end
