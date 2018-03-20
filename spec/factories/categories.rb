# encoding: utf-8

  # t.string "name"
  # t.text "description"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

FactoryBot.define do
  factory :valid_category, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end

  factory :valid_category1, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end

  factory :valid_category2, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end

  factory :valid_category3, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_category, class: Category do
    name { Faker::Name.first_name }
    description nil
  end
end
