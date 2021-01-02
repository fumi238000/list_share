require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが条件を満たす時" do
    it "保存ができる" do
      user = build (:user)
      expect(user.valid?).to eq true
    end
  end


  describe "バリデーション" do
    
    context "名前が空のとき" do
      it "エラーが発生する" do
        user = build(:user,name: "")
        expect(user.valid?).to eq false
        expect(user.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "emailが空のとき" do
      it "エラーが発生する" do
          user = build(:user,email: "")
          expect(user.valid?).to eq false
          expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end

    context "passwordが空のとき" do
      it "エラーが発生する" do
        user = build(:user,password: "")
        expect(user.valid?).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end

    context "name が20文字以上である時" do 
      it "エラーが発生する" do
        user = build(:user,name: "hogehogehogehogehogehoge")
        expect(user.valid?).to eq false
        expect(user.errors.messages[:name]).to include "は20文字以内で入力してください"
      end
    end


    #emailがすでに存在する時は無効である
    it "emailがすでに存在している時は無効であること" do
      user = User.create(name: "fumiya", email: "email@email.com", password: "password")
      user = User.new(name: "tomoya", email: "email@email.com", password: "password")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
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
