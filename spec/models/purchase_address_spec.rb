require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:product)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, product_id: product.id)
    sleep(0.1)
  end
  describe '購入情報登録' do
    context '購入できるとき' do
      it '全項目存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'postal_codeが3桁-4桁の半角数字であれば登録できる' do
        @purchase_address.postal_code = '200-3000'
        expect(@purchase_address).to be_valid
      end
      it 'buildingが未記入でも登録できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが11桁の半角数字であれば登録できる' do
        @purchase_address.phone_number = '01234567890'
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが10桁以下の半角数字でも登録できる' do
        @purchase_address.phone_number = '0412345678'
        expect(@purchase_address).to be_valid
      end
    end
    context '購入できないとき' do
      it 'postal_codeが空では登録できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeの登録にはハイフンが必要であること' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'cityが空では登録できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では登録できないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では登録できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは英数混合では登録できないこと' do
        @purchase_address.phone_number = 'a1b25678901'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは11桁以内の数値のみ登録可能なこと' do
        @purchase_address.phone_number = '012345678901'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは0から始まる数値のみ登録可能なこと' do
        @purchase_address.phone_number = 12_345_678_901
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角数字では登録できないこと' do
        @purchase_address.phone_number = '１２３４５６７８９００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'prefecture_idが空では登録できないこと' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Prefecture is invalid'
      end
      it 'prefecture_idが0(初期値)だと登録できないこと' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Prefecture is invalid'
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end