class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, :numericality => { :greater_than => 299, :less_than => 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :ship_day

  validates :name, :discription, :price, :category_id, :condition_id, :delivery_fee_id, :area_id, :ship_days_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :ship_days_id, numericality: { other_than: 1 }
end
