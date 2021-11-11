class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @item = Item.order("created_at DESC")
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
       if @item.user.id != current_user.id
        redirect_to root_path
       end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :price, :load_id, :prefecture_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
