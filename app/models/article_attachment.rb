# encoding: utf-8

class ArticleAttachment < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :article
end
