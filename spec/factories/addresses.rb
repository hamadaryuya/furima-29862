FactoryBot.define do
  factory :address do
    postal_code             { "123-4567" }
    municipality            { Faker::Name.name}
    house_number            { rand(1..100)}
    phone_number            { Faker::Base.numerify('0##########') }
    area_id                 { rand(2..48) }
    

    association :order
  end
end
