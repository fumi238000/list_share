require 'rails_helper'

RSpec.describe User, type: :model do

  describe "バリデーション" do
    subject {user.valid?} 

    context "データが条件を満たす時" do
      let(:user) { build(:user) }
      it "保存ができる" do
        expect(subject).to eq true
      end
    end
  
    context "名前が空のとき" do
      let(:user) { build(:user, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "emailが空のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
          expect(subject).to eq false
          expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end

    context "passwordが空のとき" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end

    context "name が20文字以上である時" do 
      let(:user)  { build(:user,name: "a" * 21) } 
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "は20文字以内で入力してください"
      end
    end

    context "emailがすでに存在する時は無効である" do 
      before { create(:user, email: "test@email.com") }
      let (:user) { build(:user, email: "test@email.com")}
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end
  end  








    #未実装
    context "ユーザーが削除されたとき" do
      subject { user.destroy }
      let(:user) { create(:user) }
      before do
        create_list(:category, 2, user: user)
        create(:category)
      end
      it "そのユーザーのメッセージも削除される" do
        expect { subject }.to change { user.messages.count }.by(-2)
      end
    end
  

end
