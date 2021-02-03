require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_purchase = FactoryBot.build(:user_purchase, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    
    describe 'ユーザー新規登録' do
      context '配送先の住所情報の保存できるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
        end
        it 'buildingは空でも保存できること' do
        @user_purchase.building = nil
        expect(@user_purchase).to be_valid
        end
      end

      context '配送先の住所情報の保存できないとき' do
        it 'postが空だと保存できないこと' do
        @user_purchase.post = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post can't be blank")
        end
        it 'postがハイフンがないと保存できないこと' do
        @user_purchase.post = '1234587'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post Post is invalid. Include hyphen(-)")
        end
        it "prefectureの情報がないと保存できないこと" do
        @user_purchase.prefecture_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'prefectureのidに1が選択されている場合と保存できないこと' do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'cityが空だと保存できないこと' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと保存できないこと' do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと保存できないこと' do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberがハイフンがあると保存できないこと' do
        @user_purchase.phone_number = '080-7859-8975'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Phone number is invalid. Uninclude hyphen(-)")
        end
        it 'phone_numberが11桁を超えると保存できないこと' do
        @user_purchase.phone_number = '080778598975'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Phone number is invalid. Uninclude hyphen(-)")
        end
       it 'userが紐付いていないと保存できないこと' do
       @user_purchase.user_id = nil
       @user_purchase.valid?
       expect(@user_purchase.errors.full_messages).to include("User can't be blank")
       end
       it 'itemが紐付いていないと保存できないこと' do
       @user_purchase.item_id = nil
       @user_purchase.valid?
       expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
       end
       it "tokenが空では登録できないこと" do
       @user_purchase.token = nil
       @user_purchase.valid?
       expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
       end
      end
    end
end
