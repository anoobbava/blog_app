# encoding: utf-8

class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
