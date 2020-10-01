require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'name,discription,price,category_id,condition_id,delivery_id,area_id,ship_days_id,user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'discriptionが空だと登録できない' do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it 'category_idが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが１だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'delivery_dee_idが１だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'area_idが１だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'ship_days_idが１だと登録できない' do
        @item.ship_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship days must be other than 1')
      end
      it 'priceが空白だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceに文字列が含まれていると登録できない' do
        @item.price = 'a1000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが299円以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが9999999円を超えると登録できない' do
        @item.price = '999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
    end
  end
end
