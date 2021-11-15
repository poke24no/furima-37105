class BuyerAddress
  include ActiveModel::Model
  attr_accessor :add_number, :prefecture_id, :city, :address, :building, :telephone, :buyer_id, :item_id, :user_id, :token
  

  def save
    
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    
    Address.create(add_number: add_number, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, buyer_id: buyer.id)
  end
end