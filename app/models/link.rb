# link model
class Link < ApplicationRecord
  validates :address, presence: :true
  belongs_to :article
end
