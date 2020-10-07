class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index
  

  def index
    @address = OrderAddress.new
  end

  def create
    @address = OrderAddress.new(purchase_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
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

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path unless @item.user_id != current_user.id
  end

end
