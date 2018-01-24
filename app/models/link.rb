class Link < ApplicationRecord
  validates :address, presence: :true, unique: :true
end
