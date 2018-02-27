# encoding: utf-8

require 'spec_helper'

RSpec.describe ArticlesController, type: :controller do
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
end
