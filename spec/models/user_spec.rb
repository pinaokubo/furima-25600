require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに＠が存在しない場合登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが半角英字だけでは登録できないこと' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = '0000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordが全角英数混合では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '氏名が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '苗字カナが全角カタカナ以外では登録できないこと' do
        @user.last_name_kana = '太ro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it '氏名カナが全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = '山da'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
    end
  end
end
