# encoding: utf-8

FactoryBot.define do
  factory :category1, class: Category do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end
end
