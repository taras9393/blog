class StatpagesController < ApplicationController
  def home
    @articles = Article.where('published_at <= ?', DateTime.now)
  end

  def users_all
  end

  def user_profile
  end



end
