require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、katakana_surnameとkatakana_name、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "00000l"
      @user.password_confirmation = "00000l"
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = "000"
      @user.password_confirmation = "000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英数だけでは登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
    end
    it "last_nameが半角では登録できない" do
      @user.last_name = "ki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
    end
    it "first_nameが半角では登録できない" do
      @user.first_name = "ki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "katakana_surnameが空では登録できない" do
      @user.katakana_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana surname can't be blank", "Katakana surname 全角文字を使用してください")
    end
    it "katakana_surnameが半角では登録できない" do
      @user.katakana_surname = "ki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana surname 全角文字を使用してください")
    end
    it "katakana_nameが空では登録できない" do
      @user.katakana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name can't be blank", "Katakana name 全角文字を使用してください")
    end
    it "katakana_nameが半角では登録できない" do
      @user.katakana_name = "ki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name 全角文字を使用してください")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "emailが@がないと登録できない" do
      @user.email = "test.yahoo.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

  end
end
