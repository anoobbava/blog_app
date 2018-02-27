# encoding: utf-8

FactoryBot.define do
  factory :comment1, class: Comment do
    description { Faker::Lorem.paragraph }
  end
end
