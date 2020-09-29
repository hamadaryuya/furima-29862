class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :category_id, :area_id, :condition_id, :delivery_fee_id, :ship_days_id, :image).merge(user_id: current_user.id)
  end
end