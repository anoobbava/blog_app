# encoding: utf-8

require 'spec_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:all) do
    @category = FactoryBot.create(:category1)
    @params = FactoryBot.attributes_for(:article_valid)
    @invalid_params = FactoryBot.attributes_for(:article_invalid)
    @user = FactoryBot.create(:valid_user)
    @user.confirm
    @article = FactoryBot.create(:article_valid, user: @user, category: @category)
    @comment = FactoryBot.create(:comment1, article: @article, user: @user)
  end

  it 'render to index page' do
    get :index
    expect(response).to render_template('index')
    expect(response.status).to eq(200)
  end

  it 'redirect to user signin' do
    get :new
    expect(response).to redirect_to('/users/sign_in')
    expect(response.status).to eq(302)
  end

  it 'display show template' do
    get :show, params: { id: @article.id }
    expect(response).to render_template('show')
  end

  it 'check the article belongs to user' do
    get :show, params: { id: @article.id }
    expect(@article.user_id).to eq(@user.id)
  end

  it 'check the comment belongs to user' do
    get :show, params: { id: @article.id }
    expect(@comment.user_id).to eq(@user.id)
  end

  it 'check the comment is valid' do
    get :show, params: { id: @article.id }
    expect(@article.comments.last).to eq(@comment)
  end

  it 'update the article flash messages' do
    sign_in @user
    put :update, params: { id: @article.id, article: @params }
    expect(flash[:notice]).to be_present
  end

  it 'update the article status' do
    sign_in @user
    put :update, params: { id: @article.id, article: @params }
    expect(response.status).to eq(302)
  end

  it 'fail to update the article' do
    sign_in @user
    put :update, params: { id: @article.id, article: @invalid_params }
    expect(response).to render_template('edit')
  end

  it 'delete the Article status' do
    sign_in @user
    delete :destroy, params: { id: @article.id }
    expect(response.status).to eq(302)
    expect(response).to redirect_to root_path
  end

  it 'create an article success' do
    sign_in @user
    post :create, params: { article: @params }
    expect(response.status).to eq(302)
  end

  it 'create an article failure' do
    sign_in @user
    post :create, params: { article: @invalid_params }
    expect(response).to render_template('new')
  end

  it 'render new action' do
    sign_in @user
    get :new
    expect(response).to render_template('new')
  end

  it 'fetch index using category' do
    get :index, params: { category: @category.name }
    expect(response).to render_template('index')
    expect(response.status).to eq(200)
  end
end
