require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,given_name,family_name_kana,given_name_kana,birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a123456"
        @user.password_confirmation = "a123456"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混同であれば登録できる" do
      @user.password = "a123456"
      @user.password_confirmation = "a123456"
      expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "a1234"
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混同でなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")

      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameは全角でなければ登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "given_nameは空だと登録できない" do
        @user.given_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it "given_nameは全角でなければ登録できない" do
        @user.given_name = "bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name is invalid")
      end
      it "family_name_kanaは空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaは全角カナでなければ登録できない" do
        @user.family_name_kana = "cccc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "given_name_kanaは空では登録できない" do
        @user.given_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end
      it "given_name_kanaは全角カナでなければ登録できない" do
        @user.given_name_kana = "dddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana is invalid")
      end
      it "birthは空では登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end