FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id       { 2 }
    city                { '中央区' }
    address             { '湊１丁目' }
    building            { 'スカイツリー１０１'}
    phone_number        { 12_312_345_678 }
    token               { 'tok_60ba430910a34f072a3709fab2fd' }
    
   
  end
end
