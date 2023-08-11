require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、user_last_name、user_first_name、user_last_name_add、user_first_name_addが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors[:password]).to include('is too long (maximum is 128 characters)')
      end

      it '英字のみのpasswordは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '数字のみのpasswordは登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '全角文字を含むpasswordは登録できない' do
        @user.password = 'ａａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'user_last_nameが空では登録できない' do
        @user.user_last_name = ''
        @user.valid?
        expect(@user.errors[:user_last_name]).to include("can't be blank")
      end

      it 'user_first_nameが空では登録できない' do
        @user.user_first_name = ''
        @user.valid?
        expect(@user.errors[:user_first_name]).to include("can't be blank")
      end

      it 'user_last_name_addが空では登録できない' do
        @user.user_last_name_add = ''
        @user.valid?
        expect(@user.errors[:user_last_name_add]).to include("can't be blank")
      end

      it 'user_first_name_addが空では登録できない' do
        @user.user_first_name_add = ''
        @user.valid?
        expect(@user.errors[:user_first_name_add]).to include("can't be blank")
      end

      it 'user_last_nameが正しいフォーマットでないと登録できない' do
        invalid_last_name_formats = ['123', 'abc', '!@#']
        invalid_last_name_formats.each do |format|
          @user.user_last_name = format
          @user.valid?
          expect(@user.errors[:user_last_name]).to include('is invalid')
        end
      end

      it 'user_first_nameが正しいフォーマットでないと登録できない' do
        invalid_first_name_formats = ['123', 'abc', '!@#']
        invalid_first_name_formats.each do |format|
          @user.user_first_name = format
          @user.valid?
          expect(@user.errors[:user_first_name]).to include('is invalid')
        end
      end

      it 'user_last_name_addが正しいフォーマットでないと登録できない' do
        invalid_last_name_add_formats = ['123', 'abc', '!@#', 'あいう']
        invalid_last_name_add_formats.each do |format|
          @user.user_last_name_add = format
          @user.valid?
          expect(@user.errors[:user_last_name_add]).to include('is invalid')
        end
      end

      it 'user_first_name_addが正しいフォーマットでないと登録できない' do
        invalid_first_name_add_formats = ['123', 'abc', '!@#', 'あいう']
        invalid_first_name_add_formats.each do |format|
          @user.user_first_name_add = format
          @user.valid?
          expect(@user.errors[:user_first_name_add]).to include('is invalid')
        end
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
    end
  end
end
