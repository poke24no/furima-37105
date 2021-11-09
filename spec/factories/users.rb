FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { 19_900_101 }
    first_name            { '山田' }
    family_name           { '太郎' }
    first_name_rub        { 'ヤマダ' }
    family_name_rub       { 'タロウ' }
  end
end
