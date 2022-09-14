class ItemsController < ApplicationController

  def index
   @items = Item.all
  end

  def new
   @item = Item.new
  end

  def create
   Item.create(item_params)
   redirect_to action: :index
  end
  
  private
  def item_params
    params.require(:item).permit(:title, :content, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, :price ).merge(user_id: current_user.id)
  end

end
