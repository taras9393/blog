class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_admin, except: [:index, :show]

  def index
    @categories = Category.all
    @propositions = Proposition.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.published.sort_by_created_at
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'You add new category!'
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path, notice: 'Category succesfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category succesfully deleted'
  end


private
  def category_params
    params.require(:category).permit(:name)
  end

  def user_admin
    unless current_user.admin?
    redirect_to root_path, alert: 'Access denied'
    end
  end

end
