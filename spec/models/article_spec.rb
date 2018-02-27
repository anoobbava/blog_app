# encoding: utf-8

require 'spec_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @valid_article = FactoryBot.create(:article_valid)
  end

  it 'valid article' do
    expect(@valid_article).to be_valid
  end

  it 'check category' do
    expect(@valid_article.category_id).to eq(1)
  end
end
