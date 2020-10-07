require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '購入先住所の登録' do
    context '購入先住所の登録がうまくいく時' do
      it 'postal_code,municipality,house_number,phone_number,area_id,oreder_idが存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end

  context '購入先住所の登録がうまくいかない時' do
    it 'postal_codeが空だと登録できない' do
      @address.postal_code = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'potal_codeにはハイフンが無いと登録できない' do
      @address.postal_code = "1234567"
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid")
    end

    it 'municipalityが空だと登録できない' do
      @address.municipality = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'house_numberか空だと登録できない' do
      @address.house_number = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @address.phone_number = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberは11桁で無いと登録できない' do
      @address.phone_number = "088"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberはハイフンがあると登録できない' do
      @address.phone_number = "088-0000"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberは0から始まらなければ登録できない' do
      @address.phone_number = "90000000000"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'area_idが１だと登録できない' do
      @address.area_id = "1"
      @address.valid?
      expect(@address.errors.full_messages).to include("Area must be other than 1")
    end
  end
end
end
