class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = current_user.articles.all
    @user_articles = @user.articles.all
  end

  def index
    @users = User.all
  end

  def profile
    @articles = current_user.articles.all
  end

end
