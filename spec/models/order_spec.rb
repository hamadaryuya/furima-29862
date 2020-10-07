require 'rails_helper'
describe Order do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'カード情報の登録がうまくいく時' do
    it '問題なくカード情報が登録されている時' do
      expect(@order).to be_valid
    end
  end
end
