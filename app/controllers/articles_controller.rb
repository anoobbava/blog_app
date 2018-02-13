# articles Controller
class ArticlesController < ApplicationController
  before_action :article_params, only: [:create]
  before_action :fetch_article, only: %i[show destroy edit update]
  before_action :authenticate_user!, only: %i[create new edit destroy update]

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
    @article.user_id = current_user.id
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

  def edit; end

  def show
    @links = @article.links
  end

  def update
    if @article.update(article_params)
      update_to_links(params['article']['links']) if params['article']['links']
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

  def update_to_links(hash_values)
    link = Link.new
    link.description = hash_values['description']
    link.address = hash_values['address']
    link.article_id = params[:id]
    link.user_id = current_user.id
    link.save
  end

  def article_params
    params.require(:article).permit(:title, :content, :category_id,
                                    :description, :address)
  end

  def fetch_article
    @article = Article.find_by_id(params[:id])
  end
end
