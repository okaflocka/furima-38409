class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :city, :address_num, :name_building, :phone_number

  #with_options presence: true do
    #validates :user_id, :item_id, :city, :address_num
    #validates :zipcode, format
    #validates :phone_number, format 
  #end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, address_num: address_num, name_building: name_building, phone_number: phone_number, purchase_id: purchase.id)
  end

end