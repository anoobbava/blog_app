# Article Class
class Article < ApplicationRecord
  belongs_to :category
  validates :title, :content, presence: true
  belongs_to :user
  has_many :links
end
