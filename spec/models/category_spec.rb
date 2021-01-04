require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "バリデーション" do
      subject {category.valid?} 
   
      context "データが条件を満たす時" do
         let(:category) { build(:category) }
           it "保存ができる" do
           expect(subject).to eq true
        end
      end

      context "ユーザーが存在しない時" do
        let(:category) { build(:category, user_id: "") }
        it "エラーが発生する" do
          expect(subject).to eq false
          expect(category.errors.messages[:user]).to include "を入力してください"
        end
      end

      context "nameが空の時", type: :doing  do
        # ユーザーを作成する
        let(:category) { build(:category, name: "") }
        it "エラーが発生する" do
          expect(subject).to eq false
          expect(category.errors.messages[:name]).to include "を入力してください"
        end
      end

      context "nameが21文字以上の場合" do
        # ユーザーを作成する
        let(:category) { build(:category, name: "a" * 21) }
        it "エラーが発生する" do
          expect(subject).to eq false
          expect(category.errors.messages[:user]).to include "ここを記入する"
        end
      end


  end
end

