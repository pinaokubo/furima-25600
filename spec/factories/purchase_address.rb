FactoryBot.define do
  factory :purchase_address do
    postal_code { '200-3000' }
    city { '東京' }
    address { '渋谷1-1' }
    building { '東京ハイツ' }
    phone_number { "0#{rand(1_000_000_000..9_999_999_999)}" }
    prefecture_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end