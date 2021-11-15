class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
    if  @item.buyer.present? 
      redirect_to root_path
    end
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end 

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
   if @buyer_address.valid?
     pay_item
     @buyer_address.save
     return redirect_to root_path
   else
    render :index
   end
  end

   private
  # def buyer_params
    
  # end
  
  def buyer_params
    params.require(:buyer_address).permit(:add_number, :prefecture_id, :city, :address, :building, :telephone).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buyer_params[:token],    
        currency: 'jpy'                 
      )
  end
end


# 送られてくるデータ
# ・ハッシュ => first_app
# parameters{token: "~~~", telephone: "~~~~"}
# params.permit(:token, :telephone)

# ・二重ハッシュ => 
# parameters{address{token: "~~~", telephone: "~~~~"}}
# params.require(:address).permit(:token, :telephone)

# ・複合◯
# parameters{address{telephone: "~~~"}, token: "~~~"}
# params.require(:address).permit(:telephone).merge(token: params[:token])


# 送られるデータはname属性で決まる
# name = "telephone" => 一重ハッシュ
# name = "address[telephone]" => 二重ハッシュ

# name属性はform＿withのmodelオプションで変化する
# modelオプションにインスタンスを渡すと、２重ハッシュで送信できるはず

