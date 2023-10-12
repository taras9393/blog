class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path(@article.id), notice: 'Article was successfully create.'
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    redirect_to articles_path if @article.published_at.future?
    unless can? :edit, @article
      redirect_to articles_path, alert: 'You are not author!!!'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article.id), notice: 'Article succesfully updated'
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.published.paginate(page: params[:page], per_page: 6).search(params[:search]).sort_by_created_at
  end

  def show
    @article = Article.find(params[:id])
    redirect_to articles_path if @article.published_at.future?
  end

  def destroy
    @article = Article.find(params[:id])
    redirect_to articles_path if @article.published_at.future?
    if can? :destroy, @article
      @article.destroy
      redirect_to articles_path, notice: 'Succesfully destroyed'
    else
      redirect_to articles_path, alert: 'You are not author!!!'
    end
  end

  def vote
    @article = Article.find(params[:id])
    if current_user.liked? @article
      @article.unliked_by current_user
    else
      @article.liked_by current_user
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :picture, :user_id, :category_id, :published_at)
    end

end
