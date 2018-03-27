# encoding: utf-8

class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  has_many :article_attachments, dependent: :destroy
  accepts_nested_attributes_for :article_attachments
  has_many :article_categories
  has_many :categories, through: :article_categories
end
