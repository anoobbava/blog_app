# encoding: utf-8

class ArticlesController < ApplicationController
  before_action :article_params, only: [:create]
  before_action :fetch_article, only: %i[show destroy edit update like]
  before_action :authenticate_user!, only: %i[create new edit destroy update show]
  before_action :set_categories, only: [:new, :edit, :create]

  def index
    @articles = Article.includes(:user).all.order('created_at DESC')
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      params[:article]['article_categories']['category_id'].reject{ |cat| cat.empty? }.each do |cat_id|
        @article.article_categories.create(category_id: cat_id, article_id: @article.id)
      end
      params[:article_attachments]['image'].each do |a|
        @article.article_attachments.create!(image: a, article_id: @article.id)
      end
      flash[:notice] = 'Article Created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
    @article_attachment = @article.article_attachments.build
    @article_categories = @article.article_categories.build
  end

  def edit; end

  def show
    @article_attachments = @article.article_attachments.all
    @first_image = @article_attachments.first
    @categories = Category.all
    @comments = @article.comments.includes(:user).order(id: :desc)
    @user = @article.user
    @article.update_attributes(view_count: @article.view_count + 1)
    @comment = Comment.new(article: @article)
    @article_categories = @article.article_categories.includes(:category)
  end

  def update
    if @article.update(article_params)
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

  def like
    @article.upvote_from current_user
    flash.now[:success] = 'like success'
    render layout: false
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, :article_categories,
                                    article_attachments_attributes: [:id, :article_id, :image])
  end

  def fetch_article
    @article = Article.find_by(id: params[:id])
  end

  def set_categories
    @categories = Category.pluck(:name, :id)
  end
end
