class PurchasesController < ApplicationController
  before_action :set, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index
  
  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
     if @user_purchase.valid?
       pay_item
       @user_purchase.save
    redirect_to root_path
    else
      render action: :index
    end
  end

  def set
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.purchase != nil
      redirect_to root_path
    end
  end

  private

    def purchase_params
        params.require(:user_purchase).permit( :post, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: @item.price,
         card: purchase_params[:token],
         currency:'jpy'
       )
    end
end


