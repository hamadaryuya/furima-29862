class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end

  def create
    binding.pry
    @item = Item.find_by(id: params[:item_id])
    
  end

  private

  def order_params
    params.permit(:price, :token)
  end

end
