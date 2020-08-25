FactoryBot.define do

  factory :item do
    name              {"商品"}
    content           {"good"}
    brand             {"NIKE"}
    condition         {1}
    postage_payer     {1}
    postage_type      {1}
    prefecture_id     {1}
    preparation_day   {1}
    price             {1}
    buyer_id          {}
    after(:build) do |item|
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "hello")      
      grand_child_category = child_category.children.create(name: "world")

      item.category_id = grand_child_category.id

      item.images << FactoryBot.build(:image, item_id: item.id)
      
    end
  end

  factory :image do
    image_url { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png') }
  end  

end