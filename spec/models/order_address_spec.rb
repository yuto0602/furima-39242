require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先住所の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '保存できる' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '保存できない' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include("can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」じゃないと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include('is invalid')
      end

      it '郵便番号は半角数字でなければならない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include('is invalid')
      end

      it '都道府県が空だと保存できない' do
        @order_address.from_id = nil
        @order_address.valid?
        expect(@order_address.errors[:from_id]).to include("can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors[:city]).to include("can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors[:house_number]).to include("can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("can't be blank")
      end

      it '電話番号は10桁以上11桁以内の半角数字のみでしか保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
