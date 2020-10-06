class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @address = OrderAddress.new(purchase_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = "sk_test_3cd75d85b226104a7eba8a8d"
    Payjp::Charge.create(
      amount:@item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.permit(:token)
  end

  def purchase_params
    params.permit(:postal_code, :municipality, :house_number, :building_name, :phone_number, :area_id, :token, :order_id, :item_id).merge(user_id: current_user.id)
  end

end
