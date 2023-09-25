class StatpagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def users_all
  end

  def user_profile
  end



end
