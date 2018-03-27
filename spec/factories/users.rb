# encoding: utf-8

  # t.string "email", default: "", null: false
  # t.string "encrypted_password", default: "", null: false
  # t.string "first_name"
  # t.string "last_name"
  # t.string "user_name"
  # t.string "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.integer "sign_in_count", default: 0, null: false
  # t.datetime "current_sign_in_at"
  # t.datetime "last_sign_in_at"
  # t.string "current_sign_in_ip"
  # t.string "last_sign_in_ip"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.string "confirmation_token"
  # t.datetime "confirmed_at"
  # t.datetime "confirmation_sent_at"
  # t.string "image"

FactoryBot.define do
  factory :valid_user, class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Internet.user_name(8) }
    password 'password'
    password_confirmation 'password'
    image {Faker::Avatar.image}
  end

  factory :valid_user1, class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Internet.user_name(8) }
    password 'password'
    password_confirmation 'password'
    image {Faker::Avatar.image}
  end

  factory :valid_user2, class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Internet.user_name(8) }
    password 'password'
    password_confirmation 'password'
    image {Faker::Avatar.image}
  end


  factory :valid_user3, class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Internet.user_name(8) }
    password 'password'
    password_confirmation 'password'
    image {Faker::Avatar.image}
  end

  factory :invalid_user, class: User do
    email nil
    first_name nil
    last_name nil
    user_name nil
    password 'password'
    password_confirmation 'password'
  end
end
