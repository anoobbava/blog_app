# encoding: utf-8

class Category < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :article_categories
  has_many :articles, through: :article_categories
end
