require 'rails_helper'
describe Item do
  describe "#create" do
    let(:user) { create(:user) }
    let(:item) {build(:item, seller_id: user.id)}

    it "nameとcontent、category_idとcondition, category_id,postage_payerとpostage_type,prefecture_idとpreparation_day,priceとseller_idが存在すれば登録できること" do
      expect(item).to be_valid
    end

    it "nameがないと出品できないこと" do
      item.name = nil
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "contentがないと出品できないこと" do
      item.content = nil
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end

    it "category_idがないと出品できないこと" do
      item.category_id = nil
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "conditionがないと出品できないこと" do
      item.condition = nil
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "postage_payerがないと出品できないこと" do
      item.postage_payer = nil
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "postage_typeがないと出品できないこと" do
      item.postage_type = nil
      item.valid?
      expect(item.errors[:postage_type]).to include("を入力してください")
    end

    it "prefecture_idがないと出品できないこと" do
      item.prefecture_id = nil
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "preparation_dayがないと出品できないこと" do
      item.preparation_day = nil
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "priceがないと出品できないこと" do
      item.price = nil
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "seller_idないと出品できないこと" do
      item.seller_id = nil
      item.valid?
      expect(item.errors[:seller_id]).to include("を入力してください")
    end

    it "imageがないと出品できないこと" do
      item.images = []
      item.valid?
      expect(item.errors[:images]).to include("を1つ以上指定してください")
    end

    it "imageが10を超えると出品できないこと" do
      10.times {|num|
        item.images << build(:image, item_id: item.id)
      }
      item.valid?
      expect(item.errors[:images]).to include("は10個までです")
    end
  end

  describe "update" do
    let(:user) { create(:user) }
    let(:item) {create(:item, seller_id: user.id)}

    it "nameとcontent、category_idとcondition, category_id,postage_payerとpostage_type,prefecture_idとpreparation_day,priceとseller_idが存在すれば登録できること" do
      expect(item).to be_valid
    end

    it "nameがないと更新できないこと" do
      item.name = nil
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "contentがないと更新できないこと" do
      item.content = nil
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end

    it "category_idがないと更新できないこと" do
      item.category_id = nil
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "postage_payerがないと更新できないこと" do
      item.postage_payer = nil
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "postage_typeがないと更新できないこと" do
      item.postage_type = nil
      item.valid?
      expect(item.errors[:postage_type]).to include("を入力してください")
    end

    it "prefecture_idがないと更新できないこと" do
      item.prefecture_id = nil
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "preparation_dayがないと更新できないこと" do
      item.preparation_day = nil
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "priceがないと更新できないこと" do
      item.price = nil
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "seller_idがないと更新できないこと" do
      item.seller_id = nil
      item.valid?
      expect(item.errors[:seller_id]).to include("を入力してください")
    end

    it "imageがないと更新できないこと" do
      item.images = []
      item.valid?
      expect(item.errors[:images]).to include("を1つ以上指定してください")
    end

    it "imageが10を超えると更新できないこと" do
      10.times {|num|
        item.images << build(:image, item_id: item.id)
      }
      item.valid?
      expect(item.errors[:images]).to include("は10個までです")
    end
  end

  
end