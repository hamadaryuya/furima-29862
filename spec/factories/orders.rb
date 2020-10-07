FactoryBot.define do
  factory :order do
    factory :credit_card do
    end

    association :user
    association :item
  end
end
