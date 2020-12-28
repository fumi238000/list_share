require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject { user.valid? }
    context "データが条件を満たすとき" do
      let(:user) {  build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  context "name が空のとき" do
    let(:user) { build(:user, name: "") }
    it "エラーが発生する" do
      expect(subject).to eq false
      expect(user.errors.messages[:name]).to include "を入力してください"
    end
  end


end
