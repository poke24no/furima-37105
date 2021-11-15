require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
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
  end
end
