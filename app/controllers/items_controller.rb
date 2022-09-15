class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render:edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, :price ).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
