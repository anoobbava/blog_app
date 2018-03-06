# encoding: utf-8

class ArticlesController < ApplicationController
  before_action :article_params, only: [:create]
  before_action :fetch_article, only: %i[show destroy edit update]
  before_action :authenticate_user!, only: %i[create new edit destroy update]

  def index
    @categories = Category.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @articles = Article.where(category_id: category.id)
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = 'Article Created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit; end

  def show
    @links = @article.links
    @comments = @article.comments.order(id: :desc)
    @comment = Comment.new(article: @article)
  end

  def update
    if @article.update(article_params)
      if @article.links.present?
        @article.links.last.update_attributes(user_id: current_user.id)
        ArticleMailer.update_article(@article).deliver_now
      end
      redirect_to @article
      flash[:notice] = 'Article updated'
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article Deleted'
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id,
                                    links_attributes:
                                    %i[description address id])
  end

  def fetch_article
    @article = Article.find_by(id: params[:id])
  end
end
