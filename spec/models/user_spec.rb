require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kanaが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに＠がないと登録できない' do
      @user.email = 'aaaa.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passworとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'aaa123'
      expect(@user).to be_valid
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passeordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aa123'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordと確認パスワードが一致しないと登録できない' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'bbb321'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameが全角ひらがな、カナ、漢字以外では登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end
    it 'last_nameが全角ひらがな、カナ、漢字であれば登録できる' do
      @user.last_name = 'ひらがな'
      expect(@user).to be_valid
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角ひらがな、カナ、漢字以外では登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'first_nameが全角ひらがな、カナ、漢字であれば登録できる' do
      @user.first_name = 'ひらがな'
      expect(@user).to be_valid
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'last_name_kanaが全角カナ以外では登録できない' do
      @user.last_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end

    it 'last_name_kanaが全角カナであれば登録できる' do
      @user.last_name_kana = 'カナ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaが全角カナ以外では登録できない' do
      @user.first_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'first_name_kanaが全角カナであれば登録できる' do
      @user.first_name_kana = 'カナ'
      expect(@user).to be_valid
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'birthdayがあれば登録できる' do
      @user.birthday = '1985-4-12'
      expect(@user).to be_valid
    end
  end
end
