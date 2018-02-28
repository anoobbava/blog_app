# encoding: utf-8

class Link < ApplicationRecord
  validates :address, presence: :true
  belongs_to :article
  belongs_to :user
end
