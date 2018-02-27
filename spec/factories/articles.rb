# encoding: utf-8

FactoryBot.define do
  factory :article_valid, class: Article do
    title { Faker::Name }
    content { Faker::Lorem.paragraph }
    category_id 1
    user_id 1
  end
end
