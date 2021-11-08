class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :price, :load_id, :prefecture_id, :day_id, :user_id)
  end
end
