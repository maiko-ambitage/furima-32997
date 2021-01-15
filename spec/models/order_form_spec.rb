require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
   before do
    @order_form = FactoryBot.build(:order_form)
   end

    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,city,address,phone_number,user_id,item_id,tokenが存在すれば登録できる' do
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
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
        
      end
      
      it 'prefecture_idが空だと登録できない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
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
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")

      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_form.phone_number = '123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
      
    
     
  


   
 
