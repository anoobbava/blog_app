# articles Controller
class ArticlesController < ApplicationController

  before_action :article_params, only: [:create]
  before_action :fetch_article, only: [:show, :destroy, :edit, :update]

  def index
    @categories = Category.all
    if params[:category]
      category = Category.find_by_name(params[:category])
      @articles = Article.where(category_id: category.id)
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:noticle] = 'Article Created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to @article
      flash[:noticle] = 'Article updated'
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
    params.require(:article).permit(:title, :content, :category_id)
  end

  def fetch_article
    @article = Article.find_by_id(params[:id])
  end
end
