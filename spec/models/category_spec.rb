# encoding: utf-8

require 'spec_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category = FactoryBot.create(:category1)
  end

  it 'valid ategory' do
    expect(@category).to be_valid
  end
end
