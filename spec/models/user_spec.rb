# encoding: utf-8

require 'spec_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @valid_user = FactoryBot.create(:valid_user)
    @valid_user.confirm
  end

  it 'valid article' do
    expect(@valid_user).to be_valid
  end
end
