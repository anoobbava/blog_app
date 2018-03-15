# encoding: utf-8

require 'spec_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @valid_article = FactoryBot.create(:valid_article)
  end

  it 'valid article' do
    expect(@valid_article).to be_valid
  end

  it 'check category' do
    expect(@valid_article.category).to be_valid
  end
end
