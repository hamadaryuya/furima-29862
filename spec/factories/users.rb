FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    family_name            { Faker::Japanese::Name.last_name }
    given_name             { Faker::Japanese::Name.first_name }
    family_name_kana       { Faker::Japanese::Name.last_name.yomi }
    given_name_kana        { Faker::Japanese::Name.first_name.yomi }
    birth                  { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
