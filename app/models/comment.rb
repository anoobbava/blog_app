# encoding: utf-8

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :description, presence: true
end
