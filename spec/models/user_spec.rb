require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    #名前がなければ無効な状態である
    it "名前がなければ無効な状態であること" do
      user = User.new(name: "", email: "email@email.com", password: "12345678")
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blacnk")
    end
    
    #emailがなければ無効な状態である
    it "emailがなければ無効な状態であること" do
      user = User.new(name: "fumiya", email: "", password: "12345678")
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blacnk")
    end

    #passwordがなければ無効な状態である
    it "emailがなければ無効な状態であること" do
      user = User.new(name: "fumiya", email: "email@email.com", password: "")
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blacnk")
    end







    # context "name が空のとき" do
    #   let(:user) { build(:user, name: "") }
    #   it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(user.errors.messages[:name]).to include "を入力してください"
    #   end
    # end

  #   context "email が空のとき" do
  #     it "エラーが発生する" do
  #     end
  #   end
  # end

  
  end


end
