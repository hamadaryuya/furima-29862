FactoryBot.define do
  factory :order_address do
      postal_code             { '123-4567' }
      municipality            { Faker::Name.name }
      house_number            { rand(1..100)}
      phone_number            { Faker::Base.numerify('0##########') }
      area_id                 { rand(2..48) }
      user_id                 { 1 }
      item_id                 { 1 }
      order_id                { 1 }
      token                   { FactoryBot.build(:item) }
  end
end
