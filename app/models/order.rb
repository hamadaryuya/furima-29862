class Order < ApplicationRecord
  validates :price, presence: true
end
