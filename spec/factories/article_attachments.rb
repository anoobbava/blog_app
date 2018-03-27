# encoding: utf-8

  # t.integer "article_id"
  # t.string "image"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  FactoryBot.define do
    factory :valid_article_attachment, class: ArticleAttachment do
      article_id {FactoryBot.create(:valid_article)}
      image { Faker::Avatar.image }
    end

    factory :valid_article_attachment1, class: ArticleAttachment do
      article_id {FactoryBot.create(:valid_article1)}
      image { Faker::Avatar.image }
    end

    factory :valid_article_attachment2, class: ArticleAttachment do
      article_id {FactoryBot.create(:valid_article2)}
      image { Faker::Avatar.image }
    end

    factory :valid_article_attachment3, class: ArticleAttachment do
      article_id {FactoryBot.create(:valid_article3)}
      image { Faker::Avatar.image }
    end

    factory :invalid_article_attachment, class: ArticleAttachment do
      article_id nil
      image nil
    end
  end
