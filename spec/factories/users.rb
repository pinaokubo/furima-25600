FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '剛利' }
    first_name            { '豪李' }
    last_name_kana        { 'ゴリ' }
    first_name_kana       { 'ゴリ' }
    birthday              { '1986/10/24' }
  end
end
