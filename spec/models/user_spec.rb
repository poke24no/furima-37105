require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
  context '新規登録できる時'
    it '全ての項目が存在すれば登録できる' do
      
    end
  context '新規登録できない時' do
    it 'nameが空では登録できない' do
      
     end 
    it 'emailが空では保存できない' do
      
     end
    it 'emailが一意性であること' do
      
     end
    it 'emailには@がないと登録できない' do
      
     end
    it 'passwaordが空では登録できない' do
      
     end
    it 'passwordは6文字以上ないと登録できない' do
      
     end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      
     end
    it 'passwordには半角英数字混合でないと登録できない' do
      
     end
    it '苗字と名前(全角)が空では登録できない' do
      
     end
    it '苗字と名前(全角)は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
      
     end
    it '苗字と名前(カナ)が空では登録できない' do
      
     end
    it '苗字と名前(カナ)は全角(カタカナ)でないと登録できない' do
      
     end
    it '生年月日が空では登録できない' do
      
    end
  end
  end

end
