# encoding: utf-8

FactoryBot.define do
  factory :valid_comment, class: Comment do
    description { Faker::Lorem.paragraph }
  end

  factory :invalid_comment, class: Comment do
    description nil
  end
end
