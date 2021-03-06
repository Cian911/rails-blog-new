class CommentsController < ApplicationController

  # We obviously dont want any user to be able to delete comments
  # So add an authentication layer here too.
  http_basic_authenticate_with name: "Cian", password: "password", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commentor, :email, :body)
    end

end
