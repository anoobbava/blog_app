# encoding: utf-8

  # t.string "title"
  # t.text "content"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.integer "user_id"
  # t.integer "view_count", default: 0
  # t.index ["user_id"], name: "index_articles_on_user_id"

FactoryBot.define do
  factory :valid_article, class: Article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    user { FactoryBot.create(:valid_user) }
  end

  factory :valid_article1, class: Article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    user { FactoryBot.create(:valid_user) }
  end

  factory :valid_article2, class: Article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    user { FactoryBot.create(:valid_user) }
  end

  factory :valid_article3, class: Article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    user { FactoryBot.create(:valid_user) }
  end

  factory :invalid_article, class: Article do
    title { Faker::Book.title }
    content nil
  end
end
