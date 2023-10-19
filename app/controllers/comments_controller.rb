class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params.merge!(:user_id => current_user.id))
    if @comment.save
      redirect_to article_path(@article.id), notice: "Comment successfuly added"
    else
      redirect_to article_path(@article.id), alert: "Comment can not be added"
    end
  end

  def edit
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if can? :destroy, @comment
      @comment.destroy
      redirect_to article_path(@article.id), notice: "Nice destroy"
    else
      redirect_to article_path(@article.id), alert: "You can not delete other comments"
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
