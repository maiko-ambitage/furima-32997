class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index,:create]
  before_action :set_item, only: [:index,:create]
 
  before_action :divide_user,only:[:index,:create]

  def index
    @order_form = OrderForm.new
    if @item.order != nil
      redirect_to root_path
    end
  end
   
   

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
     
      render action: :index
    end    
  end
 
   private
  
  def order_form_params
    params.require(:order_form).permit(:postal_code,:prefecture_id,:city,:address,:building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],  
      currency: 'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  

  def divide_user
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

end
    
   
   

   
      
      

    

      

