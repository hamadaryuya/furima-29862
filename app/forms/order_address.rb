class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :municipality, :house_number, :building_name, :phone_number, :area_id ,:token, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    validates :area_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, area_id: area_id, order_id: order.id)
  end
end