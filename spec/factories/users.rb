# encoding: utf-8

FactoryBot.define do
  factory :valid_user, class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Name.first_name }
    password 'password'
    password_confirmation 'password'
  end

  factory :invalid_user, class: User do
    email nil
    first_name nil
    last_name nil
    user_name nil
    password 'password'
    password_confirmation 'password'
  end
end
