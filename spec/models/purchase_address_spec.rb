require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' 
    
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '正常に購入できるとき' do
      it '住所と電話番号を入力かつ、tokenが生成されると購入できる' do
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
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が「3桁ハイフン4桁」でなければ購入できない' do
        @purchase_address.zipcode = '9998888'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号はハイフンを入れた形式で入力してください")
      end
      it '都道府県が初期値「---」のままでは購入できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村がなければ購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地がなければ購入できない' do
        @purchase_address.address_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号がなければ購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が10桁未満の半角数値では購入できない' do
        @purchase_address.phone_number = '12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10桁または11桁の半角数字で入力してください")
      end
      it '電話番号が12桁以上の半角数値では購入できない' do
        @purchase_address.phone_number = '1234512345123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10桁または11桁の半角数字で入力してください")
      end
      it '電話番号に半角数値以外が含まれると購入できない' do
        @purchase_address.phone_number = '090１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10桁または11桁の半角数字で入力してください")
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが紐づいていないと購入できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐づいていないと購入できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end

end


#bundle exec rspec spec/models/purchase_address_spec.rb