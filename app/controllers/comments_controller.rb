# encoding: utf-8

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    comment = Comment.new(comment_params)
    if comment.save
      ArticleMailer.comment_on_article(@article, comment).deliver_now
      flash.now[:success] = 'commented successfully'
      @comments = @article.comments
    else
      flash[:notice] = "Error on comment Creation >> #{comment.errors.full_messages.to_sentence}"
    end
    render layout: false
  end

  def destroy
    comment = Comment.find(params[:id])
    redirect_to(comment.article) if comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description).merge(user_id: current_user.id,
                                                        article_id: params[:article_id])
  end
end
