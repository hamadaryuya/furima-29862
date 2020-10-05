class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :price, presence: true
  has_one :address
end
