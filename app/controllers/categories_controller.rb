# encoding: utf-8

class CategoriesController < ApplicationController
  before_action :fatch_category, only: [:edit, :show, :update, :destroy]
  before_action :permit_params, only: [:create]
  respond_to :html, :json

  def new
    @category = Category.new
    respond_modal_with @category
  end

  def create
    @category = Category.new(permit_params)
    if @category.save
      flash[:notice] = 'Category created'
      respond_modal_with @category, location: root_path
    end
  end

  def update
    if @category.update(permit_params)
      redirect_to categories_path
      flash[:notice] = 'Article Updated'
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
      flash[:notice] = 'Category Deleted'
    end
  end

  def edit
  end

  def show
  end

  def index
    @categories = Category.all.order('created_at DESC')
  end


  private

  def permit_params
    params.require(:category).permit(:name, :description)
  end

  def fatch_category
    @category = Category.find(params[:id])
  end
end
