class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      @item.update(item_params)
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :prepare_days_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
