class Article < ApplicationRecord
  belongs_to :category
  validates :title, :content, presence: true
end
