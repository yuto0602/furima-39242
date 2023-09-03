FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.word }
    item_description { Faker::Lorem.paragraph_by_chars(number: 256) }
    item_category_id { Faker::Number.between(from: 2, to: 11) }
    item_condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    from_id { Faker::Number.between(from: 2, to: 48) }
    date_of_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
