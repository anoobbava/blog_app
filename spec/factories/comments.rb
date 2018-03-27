# encoding: utf-8

  # t.string "description"
  # t.integer "user_id"
  # t.integer "article_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

FactoryBot.define do
  factory :valid_comment, class: Comment do
    description { Faker::Lorem.paragraph }
  end

  factory :valid_comment1, class: Comment do
    description { Faker::Lorem.paragraph }
  end

  factory :valid_comment2, class: Comment do
    description { Faker::Lorem.paragraph }
  end

  factory :valid_comment3, class: Comment do
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_comment, class: Comment do
    description nil
  end
end
