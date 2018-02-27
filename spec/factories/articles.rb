# encoding: utf-8

FactoryBot.define do
  factory :article_valid, class: Article do
    title { Faker::Name }
    content { Faker::Lorem.paragraph }
    category_id 1
  end

  factory :article_invalid, class: Article do
    title { Faker::Name }
    content nil
  end
end
