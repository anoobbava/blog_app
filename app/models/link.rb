# link model
class Link < ApplicationRecord
  # validates :address, presence: :true, unique: :true
  belongs_to :article
end
