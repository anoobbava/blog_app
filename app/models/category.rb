# encoding: utf-8

class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
end
