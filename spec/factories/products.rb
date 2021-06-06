FactoryBot.define do
  factory :product do
    name                    { Faker::Name.initials(number: 4) }
    info                    { 'test' }
    category_id             { 1 }
    status_id               { 1 }
    shipping_fee_id         { 1 }
    prefecture_id           { 1 }
    scheduled_delivery_id   { 1 }
    price                   { 500 }
    after(:build) do |product|
      product.image.attach(io: File.open('public/image/test-image.png'), filename: 'test-image.png')
    end
    association :user
  end
end
