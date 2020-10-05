class Address < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :house_number
    validates :building_name
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    validates :area_id, numericality: { other_than: 1 }
  end
end
