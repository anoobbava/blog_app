# encoding: utf-8

class Article < ApplicationRecord
  belongs_to :category
  validates :title, :content, presence: true
  belongs_to :user
  has_many :links
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :links
  mount_uploader :image, ImageUploader
end
