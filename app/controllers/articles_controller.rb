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
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if can? :destroy, @article
      @article.destroy
      redirect_to articles_path, notice: 'Succesfully destroyed'
    else
      redirect_to articles_path, alert: 'You are not author!!!'
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :picture, :user_id, :category_id)
    end

end