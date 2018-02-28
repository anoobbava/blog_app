# encoding: utf-8

FactoryBot.define do
  factory :valid_link, class: Link do
    description { Faker::Lorem.paragraph }
    address { Faker::Internet.url }
  end

  factory :invalid_link, class: Link do
    description { Faker::Lorem.paragraph }
    address nil
  end
end
