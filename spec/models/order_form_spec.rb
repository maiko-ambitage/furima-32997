require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item,user_id:@user.id)
      @buyer = FactoryBot.create(:user)
      @order_form = FactoryBot.build(:order_form, user_id: @buyer.id, item_id: @item.id)
      
    end

    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,city,address,phone_number,building,user_id,item_id,tokenが存在すれば登録できる' do
        expect(@order_form).to be_valid
      end

      it 'buildingが空でも登録できる'do
        @order_form.building = ""
        expect(@order_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと登録できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが空だと登録できない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと登録できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると登録できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_form.phone_number = '123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが英数混合では登録できない' do
        @order_form.phone_number = '123456abcde'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない'do
      @order_form.user_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
       
      end 
      it 'item_idが空では登録できない'do
      @order_form.item_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end 
      
    end
  end
end
