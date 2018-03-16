# encoding: utf-8

class Article < ApplicationRecord
  belongs_to :category
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  acts_as_votable
  has_many :article_attachments
  accepts_nested_attributes_for :article_attachments
end
