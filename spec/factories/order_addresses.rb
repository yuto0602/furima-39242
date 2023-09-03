FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    from_id { Faker::Number.between(from: 2, to: 48) }
    city { '第3東京市' }
    house_number { '1-1' }
    building_name { 'ディズニーシー' }
    phone_number { '09000001111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
