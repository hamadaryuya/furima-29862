class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_3cd75d85b226104a7eba8a8d"
    Payjp::Charge.create(
      amount:@item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
