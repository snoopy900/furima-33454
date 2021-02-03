FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"太郎"}
    first_name            {"山田"}
    katakana_surname      {"タロウ"}
    katakana_name         {"ヤマダ"}
    birthday              {"20200101"}
    
  end
end
