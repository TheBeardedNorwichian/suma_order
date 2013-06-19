FactoryGirl.define do
  factory :base_data do |bd|
    bd.category_name "TEST CATEGORY"
    bd.brand "BRAND"
    bd.code "123TEST"
    bd.description "This is a description"
    bd.details "and these are the details"
    bd.size "6x150kg"
    bd.price 56.89
    bd.vat true
    bd.rrp 4.56
    bd.b "B"
    bd.g "g"  
  end
end
