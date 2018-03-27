# encoding: utf-8
require 'pry'
require 'spec_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:all) do
    @category_ids = []
    @category_ids << FactoryBot.create(:valid_category)
    @category_ids<< FactoryBot.create(:valid_category1)
    @category_ids << FactoryBot.create(:valid_category2)
    @params = FactoryBot.attributes_for(:valid_article)
    @article_attachment_params = FactoryBot.attributes_for(:valid_article_attachment)
    @invalid_params = FactoryBot.attributes_for(:invalid_article)
    @user = FactoryBot.create(:valid_user)
    @user.confirm
    @article = FactoryBot.create(:valid_article, user: @user)
    @comment = FactoryBot.create(:valid_comment, article: @article, user: @user)
  end

  it 'render to index page' do
    get :index
    expect(response).to render_template('index')
    expect(response.status).to eq(200)
  end

  it 'need to signin to display the article' do
    get :show, params:{id: @article}
    expect(response).to redirect_to('/users/sign_in')
    expect(response.status).to eq(302)
  end

  it 'redirect to user signin' do
    get :new
    expect(response).to redirect_to('/users/sign_in')
    expect(response.status).to eq(302)
  end

  it 'display show template' do
    sign_in @user
    get :show, params: { id: @article.id }
    expect(response).to render_template('show')
  end

  it 'check the article belongs to user' do
    sign_in @user
    get :show, params: { id: @article.id }
    expect(@article.user_id).to eq(@user.id)
  end

  it 'check the comment belongs to user' do
    sign_in @user
    get :show, params: { id: @article.id }
    expect(@comment.user_id).to eq(@user.id)
  end

  it 'check the comment is valid' do
    sign_in @user
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

  it 'create an article success' do
    sign_in @user
    article_attachments = {}
    article_categories = {}
    article_categories['category_id'] = @category_ids.map(&:id)
    article_attachments['image'] = Faker::Avatar.image, Faker::Avatar.image
    post :create, params: { article: @params.merge(article_categories: article_categories),
                            article_attachments: article_attachments }
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

  it 'check the like success or not' do
    sign_in @user
    expect { put :like, params: {id: @article.id}, format: :json }.to raise_error
  end



  it 'delete the Article status' do
    sign_in @user
    delete :destroy, params: { id: @article.id }
    expect(response.status).to eq(302)
    expect(response).to redirect_to root_path
  end
end
