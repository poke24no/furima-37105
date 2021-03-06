class BuyerAddress
  include ActiveModel::Model
  attr_accessor :add_number, :prefecture_id, :city, :address, :building, :telephone, :buyer_id, :item_id, :user_id, :token
  with_options presence: true do
  validates :token
  validates :add_number,          format: { with: /\A\d{3}[-]\d{4}\z/ } 
  validates :prefecture_id,       numericality: { other_than: 1 }
  validates :city              
  validates :address          
  validates :telephone,           format: { with: /\A\d{10}$|^\d{11}\z/ } 
  validates :user_id
  validates :item_id
  end

  def save
    
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    
    Address.create(add_number: add_number, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, buyer_id: buyer.id)
  end
end