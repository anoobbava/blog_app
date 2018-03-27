require 'spec_helper'
require 'pry'
RSpec.describe CategoriesController, type: :controller do

    before(:all) do
      @category = FactoryBot.create(:valid_category)
      # @category_ids<< FactoryBot.create(:valid_category1)
      # @category_ids << FactoryBot.create(:valid_category2)
      # @params = FactoryBot.attributes_for(:valid_article)
      # @article_attachment_params = FactoryBot.attributes_for(:valid_article_attachment)
      # @invalid_params = FactoryBot.attributes_for(:invalid_article)
      @valid_category_params = FactoryBot.attributes_for(:valid_category)
      @invalid_category_params = FactoryBot.attributes_for(:valid_category1)
      @user = FactoryBot.create(:valid_user)
      @user.confirm
      # @article = FactoryBot.create(:valid_article, user: @user)
      # @comment = FactoryBot.create(:valid_comment, article: @article, user: @user)
    end

  it 'checks the new action' do
    sign_in @user
    get :new
    expect(response).to render_template('new')
    expect(response.status).to eq(200)
  end

  it 'redirects to sign_in' do
    get :new
    expect(response).to redirect_to('/users/sign_in')
    expect(response.status).to eq(302)
  end

  it 'update the article status' do
    sign_in @user
    put :update, params: { id: @category.id, category: @valid_category_params }
    expect(response.status).to eq(302)
  end

  it 'fail to update the article' do
    sign_in @user
    put :update, params: { id: @category.id, category: @invalid_category_params }
    expect(response.status).to eq(302)
  end

  it 'fetch the index' do
    sign_in @user
    get :index
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

   it 'delete the category' do
    sign_in @user
    delete :destroy, params: {id: @category.id}
    expect(response).to redirect_to categories_path
    expect(response.status).to eq(302)
  end

  it 'creates the category' do
    sign_in @user
    post :create, params: {category: @valid_category_params}
    expect(response.status).to eq(302)
  end



end
