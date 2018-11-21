# encoding: utf-8

class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article

  def self.fetch_similar_category_items(article_categories, article)
    similar_article_cats = where('category_id in (?)', article_categories.pluck(:id))
    similar_article_cats.pluck(:article_id).uniq - [article.id]
  end
end
