FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
    name             { Faker::Name.name }
    discription      { Faker::Lorem.characters }
    price            { rand(300..9_999_999) }
    category_id      { rand(2..10) }
    condition_id     { rand(2..7) }
    delivery_fee_id  { rand(2..3) }
    area_id          { rand(2..48) }
    ship_days_id     { rand(2..4) }
    user_id          { 1 }

    association :user
  end
end
