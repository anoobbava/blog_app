# encoding: utf-8

  # t.integer "recipient_id"
  # t.integer "actor_id"
  # t.datetime "read_at"
  # t.string "action"
  # t.string "notifiable_id"
  # t.string "notifiable_type"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

FactoryBot.define do
  factory :valid_notification, class: Notification do
    recipient_id { Factorybot.create(:valid_user).id }
    actor_id { Factorybot.create(:valid_user1).id }
    action 'commented'
    notifiable{ Factorybot.create(:valid_article) }
  end

  factory :valid_notification1, class: Notification do
    recipient_id { Factorybot.create(:valid_user1).id }
    actor_id { Factorybot.create(:valid_user2).id }
    action 'commented'
    notifiable{ Factorybot.create(:valid_article2) }
  end

  factory :valid_notification2, class: Notification do
    recipient_id { Factorybot.create(:valid_user3).id }
    actor_id { Factorybot.create(:valid_user).id }
    action 'commented'
    notifiable{ Factorybot.create(:valid_article3) }
  end

  factory :valid_notification3, class: Notification do
    recipient_id { Factorybot.create(:valid_user1).id }
    actor_id { Factorybot.create(:valid_user2).id }
    action 'commented'
    notifiable{ Factorybot.create(:valid_article1) }
  end

  factory :invalid_notification, class: Notification do
    recipient_id nil
    actor_id nil
    action nil
    notifiable nil
  end
end
