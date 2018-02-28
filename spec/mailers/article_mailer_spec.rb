# encoding: utf-8

require 'spec_helper'

RSpec.describe ArticleMailer, type: :mailer do
  before(:all) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    user1 = FactoryBot.create(:valid_user)
    user2 = FactoryBot.create(:valid_user)
    category = FactoryBot.create(:valid_category)
    @article = FactoryBot.create(:valid_article, user: user1, category: category)
    FactoryBot.create(:valid_link, article: @article, user: user1)
    @comment = FactoryBot.create(:valid_comment, article: @article, user: user2)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'check update mail send' do
    ArticleMailer.update_article(@article).deliver
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.first.subject).to eq('Citation Added')
  end

  it 'check comment success' do
    ArticleMailer.comment_on_article(@article, @comment).deliver
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.first.subject).to eq('commented on your post')
  end
end
