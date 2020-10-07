class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{10}\z/ }
    validates :area_id, numericality: { other_than: 1 }
  end
end
