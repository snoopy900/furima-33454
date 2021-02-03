FactoryBot.define do
  factory :user_purchase do
    post {'123-4598'}
    prefecture_id { 2 }
    city { '東京都' }
    address { '北区1−2-2' }
    building { '東京ハイツ' }
    phone_number { '09078238315' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
