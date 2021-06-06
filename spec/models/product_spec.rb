require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '出品商品登録' do
    context '商品登録できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'priceが300以上であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
      it 'priceが9,999,999以下であれば登録できる' do
        @product.price = 9_999_999
        expect(@product).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageが空だと保存できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと保存できないこと' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空だと保存できないこと' do
        @product.info = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idが空だと保存できないこと' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが0(初期値)だと保存できないこと' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is invalid'
      end
      it 'status_idが空だと保存できないこと' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Status can't be blank"
      end
      it 'status_idが0(初期値)だと保存できないこと' do
        @product.status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include 'Status is invalid'
      end
      it 'shipping_fee_idが空だと保存できないこと' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'shipping_fee_idが0(初期値)だと保存できないこと' do
        @product.shipping_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include 'Shipping fee is invalid'
      end
      it 'prefecture_idが空だと保存できないこと' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが0(初期値)だと保存できないこと' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture is invalid'
      end
      it 'scheduled_delivery_idが空だと保存できないこと' do
        @product.scheduled_delivery_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'scheduled_delivery_idが0(初期値)だと保存できないこと' do
        @product.scheduled_delivery_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include 'Scheduled delivery is invalid'
      end
      it 'priceが空だと保存できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが299以下では登録できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが10,000,000以上では登録できないこと' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが全角数字では登録できないこと' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが半角英数混合では登録できないこと' do
        @product.price = 'a300'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @product.price = 'aaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is invalid'
      end
      it 'ユーザーが紐付いていなければ登録できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include 'User must exist'
      end
    end
  end
end