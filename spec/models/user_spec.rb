require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe do
    context '新規登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@がないと登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwaordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上ないと登録できない' do
        @user.password = 'abcd6'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordには半角英数字混合でないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あああああa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '苗字(全角)が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '名前(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字(全角)は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.family_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名前(全角)は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.first_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '苗字(カナ)が空では登録できない' do
        @user.family_name_rub = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name rub can't be blank")
      end
      it '名前(カナ)が空では登録できない' do
        @user.first_name_rub = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name rub can't be blank")
      end
      it '苗字(カナ)は全角(カタカナ)でないと登録できない' do
        @user.family_name_rub = '山だ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name rub is invalid')
      end
      it '名前(カナ)は全角(カタカナ)でないと登録できない' do
        @user.first_name_rub = '山だ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name rub is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
