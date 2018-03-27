# encoding: utf-8

  # t.integer "article_id"
  # t.integer "category_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

FactoryBot.define do
  factory :valid_article_category, class: ArticleCategory do
    article_id { FactoryBot.create(:valid_article) }
    category_id {FactoryBot.create(:valid_category)}
  end

  factory :valid_article_category1, class: ArticleCategory do
    article_id { FactoryBot.create(:valid_article1) }
    category_id {FactoryBot.create(:valid_category1)}
  end

  factory :valid_article_category2, class: ArticleCategory do
    article_id { FactoryBot.create(:valid_article2) }
    category_id {FactoryBot.create(:valid_category2)}
  end

  factory :valid_article_category3, class: ArticleCategory do
    article_id { FactoryBot.create(:valid_article3) }
    category_id {FactoryBot.create(:valid_category3)}
  end

  factory :invalid_article_category, class: ArticleCategory do
    article_id nil
    category_id nil
  end

end
