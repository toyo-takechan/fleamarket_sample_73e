require 'rails_helper'
describe User 
  describe "#create" do
    it "userが保存できること"do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがないと保存できないこと"do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end