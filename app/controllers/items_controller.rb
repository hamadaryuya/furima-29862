class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :prohibit_access, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def update
    if @item.update(item_params)
       redirect_to action: :show
    else 
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :category_id, :area_id, :condition_id, :delivery_fee_id, :ship_days_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prohibit_access
    if @item.user_id != current_user.id
      redirect_to action: :show
    end
  end
end
