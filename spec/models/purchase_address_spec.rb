require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' 
    
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '正常に購入できるとき' do
      it '住所と電話番号を入力すると購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_address.name_building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号がなければ購入できない' do
        @purchase_address.zipcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」でなければ購入できない' do
        @purchase_address.zipcode = '9998888'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
      end
      it '都道府県を選択しなければ購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がなければ購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地がなければ購入できない' do
        @purchase_address.address_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address num can't be blank")
      end
      it '電話番号がなければ購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁以上11桁以内の半角数値でなければ購入できない' do
        @purchase_address.phone_number = '12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end


end


#bundle exec rspec spec/models/purchase_address_spec.rb