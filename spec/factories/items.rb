FactoryBot.define do
  factory :item do
    title        {Faker::Lorem.sentence}
    information  {Faker::Lorem.sentence}
    category_id     {"2"}
    status_id       {"2"}
    fee_id          {"2"}
    prefecture_id   {"36"}
    day_id          {"3"}
    price        {"3000"}
    association  :user
  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/jp21t_fr_0034.png'), filename: 'jp21t_fr_0034.png')
    end
  end
end
