FactoryBot.define do
  factory :item do
    name             { '商品名' }
    info             { 'とても良い商品です' }
    category_id             { 2 }
    status_id               { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    prepare_day_id { 2 }
    price { 500 }
    
  end
end
