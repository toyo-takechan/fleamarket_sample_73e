FactoryBot.define do

  factory :item do
    name              {"商品"}
    content           {"good"}
    category_id       {"1"}
    brand             {"NIKE"}
    condition         {"1"}
    postage_payer     {"1"}
    postage_type      {"1"}
    prefecture_id     {"1"}
    preparation_day   {"1"}
    price             {"1"}
    seller_id         {"1"}
    buyer_id          {"1"}
  end

end