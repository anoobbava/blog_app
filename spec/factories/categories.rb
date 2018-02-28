# encoding: utf-8

FactoryBot.define do
  factory :valid_category, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_category, class: Category do
    name { Faker::Name.first_name }
    description nil
  end
end
