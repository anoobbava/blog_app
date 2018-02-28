# encoding: utf-8

require 'spec_helper'

RSpec.describe Link, type: :model do
  before(:all) do
    category = FactoryBot.create(:valid_category)
    user = FactoryBot.create(:valid_user)
    user.confirm
    article = FactoryBot.create(:valid_article, user: user, category: category)
    @link = FactoryBot.create(:valid_link, article: article, user: user)
    @invalid_link = FactoryBot.build(:invalid_link, article: article, user: user)
  end

  it 'valid Link' do
    expect(@link).to be_valid
  end

  it 'valid Link' do
    expect(@invalid_link).to be_invalid
  end
end
