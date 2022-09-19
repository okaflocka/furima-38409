class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase != nil
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:zipcode, :prefecture_id, :city, :address_num, :name_building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
