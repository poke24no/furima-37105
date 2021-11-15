require 'rails_helper'
#bundle exec rspec spec/models/buyer_address_spec.rb
RSpec.describe BuyerAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, item_id: item.id,)
  end

  describe do
    context '新規登録できる時' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@buyer_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end
    context '保存できない時' do
      it 'トークンが空だとと保存できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'add_numberが空だとと保存できない' do
        @buyer_address.add_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Add number can't be blank")
      end
      it 'add_numberは3桁ハイフン4桁でないと保存できない' do
        @buyer_address.add_number = '1231234'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Add number is invalid")
      end
      it 'prefecure_idが--だと保存できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存できない' do
        @buyer_address.telephone = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid")
      end
      it 'telephoneは10桁以上11桁以内で半角数字でないと保存できない' do
        @buyer_address.telephone = 123-1234-1234
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
    end
  end
end
