require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context "商品情報が保存できる場合" do
      it "出品画像,商品名,商品の説明,商品のカテゴリー,商品の状態,配送料の負担,発送元の地域,発送までの日数,価格があれば商品情報は保存される" do
        expect(@item).to be_valid
      end
      it "価格の範囲が,￥300~¥9,999,999の間であれば商品情報は保存される" do
        @item.price = 500
        expect(@item).to be_valid
      end
    end
    context "商品情報が保存できない場合" do
      it "商品画像を１枚つけないと商品の情報は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと商品の情報は保存できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明がないと商品の情報は保存できない" do
        @item.information  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it "カテゴリーの情報がないと商品の情報は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報がないと商品の情報は保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担についての情報がないと商品の情報は保存できない" do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "発送元の地域についての情報がないと商品の情報は保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数についての情報がないと商品の情報は保存できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "価格についての情報がないと商品の情報は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が,￥300~¥9,999,999の間でなければ商品の情報は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格は全角数字であれば商品の情報は保存できない" do
        @item.price = "１２３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと商品の情報は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "商品価格が10_000_000円以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "商品の状態についてのidに1が選択されている場合出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についてのidに1が選択されている場合出品できない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it "発送元の地域についてのidに1が選択されている場合出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数についてのidに1が選択されている場合出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "カテゴリーついてのidに1が選択されている場合出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end
