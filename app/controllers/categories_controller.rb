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
  end

  def destroy
  end

  def edit
  end

  def show
  end


  private

  def permit_params
    params.require(:category).permit(:name, :description)
  end

  def fatch_category
    @category = Category.find(params[:id])
  end
end
