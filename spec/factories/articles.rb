# encoding: utf-8

FactoryBot.define do
  factory :valid_article, class: Article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    category_id 1
  end

  factory :invalid_article, class: Article do
    title { Faker::Book.title }
    content nil
  end
end
