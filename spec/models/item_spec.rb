require 'rails_helper'
describe Item do
  describe "#create" do

    it "nameとcontent、category_idとcondition, postage_payerとpostage_type,prefecture_idとpreparation_day,priceとseller_idが存在すれば登録できること" do
      category = create(:category)
      item = build(:item, category_id: category.id)
      expect(item).to be_valid
    end

    it "nameがないと出品できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "contentがないと出品できないこと" do
      item = build(:item, content: nil)
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end

    it "category_idがないと出品できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "conditionがないと出品できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "postage_payerがないと出品できないこと" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "postage_typeがないと出品できないこと" do
      item = build(:item, postage_type: nil)
      item.valid?
      expect(item.errors[:postage_type]).to include("を入力してください")
    end

    it "prefecture_idがないと出品できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "preparation_dayがないと出品できないこと" do
      item = build(:item, preparation_day: nil)
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "priceがないと出品できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "seller_idないと出品できないこと" do
      item = build(:item, seller_id: nil)
      item.valid?
      expect(item.errors[:seller_id]).to include("を入力してください")
    end
  end
end