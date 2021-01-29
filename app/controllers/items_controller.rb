class ItemsController < ApplicationController
  before_action :set, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def set
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:title, :information, :category_id, :status_id, :fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
