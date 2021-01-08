require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name,info,category_id,status_id,shipping_fee_status_id,prefecture_id,prepare_days_id,price,userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = 10_000
        expect(@item).to be_valid
      end
      it '価格の範囲が¥300~¥9,999,999であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_fee_status_idが空では登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prepare_days_idが空では登録できない' do
        @item.prepare_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepare days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceの範囲が¥300未満では登録出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceの範囲が¥10,000,000以上では登録出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'category_idが1の場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1の場合登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_fee_status_idが1の場合登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end
      it 'prefecture_idが1の場合登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prepare_days_idが1の場合登録できない' do
        @item.prepare_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prepare days must be other than 1')
      end
    end
  end
end
