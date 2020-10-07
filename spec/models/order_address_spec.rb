require 'rails_helper'
describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入先住所の登録' do
    context '購入先住所の登録がうまくいく時' do
      it 'postal_code,municipality,house_number,phone_number,area_id,oreder_idが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも登録ができる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入先住所の登録がうまくいかない時' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'potal_codeにはハイフンが無いと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'municipalityが空だと登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberか空だと登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは11桁で無いと登録できない' do
        @order_address.phone_number = '088'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberはハイフンがあると登録できない' do
        @order_address.phone_number = '088-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは0から始まらなければ登録できない' do
        @order_address.phone_number = '90000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'area_idが１だと登録できない' do
        @order_address.area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 1')
      end

      it 'tokenが無い場合は購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
