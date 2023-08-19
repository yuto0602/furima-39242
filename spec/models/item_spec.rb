require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '必要な情報が全て存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it '商品名がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors[:item_name]).to include("can't be blank")
      end

      it '商品説明がないと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors[:item_description]).to include("can't be blank")
      end

      it 'カテゴリーが未選択だと出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors[:item_category_id]).to include("can't be blank")
      end

      it '商品状態が未選択だと出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors[:item_condition_id]).to include("can't be blank")
      end

      it '配送料の負担が未選択だと出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors[:delivery_charge_id]).to include("can't be blank")
      end

      it '発送元の地域が未選択だと出品できない' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors[:from_id]).to include("can't be blank")
      end

      it '発送までの日数が未選択だと出品できない' do
        @item.date_of_delivery_id = 1
        @item.valid?
        expect(@item.errors[:date_of_delivery_id]).to include("can't be blank")
      end

      it '価格が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格が300以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格が10000000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '半角数字以外で価格入力すると出品できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end
    end
  end
end

