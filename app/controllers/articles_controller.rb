class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Bicycle was successfully added.'
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to bicycle_path(@article.id)
    else
      render 'edit'
    end
  end

  def index
    @articles = Articles.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to bicycles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :picture, :user_id)
    end

end
