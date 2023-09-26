class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:profile]
  before_action :user_admin, only: [:destroy, :index]
  def show
    @user = User.find(params[:id])
    #@articles = current_user.articles.all
    @user_articles = @user.articles.all
  end

  def index
    @users = User.all
  end

  def profile
    @articles = current_user.articles.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_admin
    unless current_user.admin?
    redirect_to root_path, alert: 'Access denied'
    end
  end

end
