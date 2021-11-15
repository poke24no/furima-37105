# class AddressesController < ApplicationController
#   def index
#     @item = Item.find(params[:item_id])
#     @address = Address.new
#   end

#   def create
#     @item = Item.find(params[:item_id])
#     @address = Address.new(address_params)
#    if @address.valid?

#      pay_item
#      @address.save
#      return redirect_to item_path
#    else
#     render :index
#    end
#   end

#    private
#   def buyer_params
    
#   end
  
#   def address_params
#     params.require(:address).permit(:add_number, :prefecture_id, :city, :address, :building, :telephone).merge(token: params[:token])
#   end

#   def pay_item
#     Payjp.api_key = "sk_test_6af2b032acdda04636d25738"  
#       Payjp::Charge.create(
#         amount: @item.price,  
#         card: address_params[:token],    
#         currency: 'jpy'                 
#       )
#   end
# end


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