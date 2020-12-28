require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do


    context "name が空のとき" do
      let(:user) { build(:user, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "email が空のとき" do
      it "エラーが発生する" do
      end
    end
  end

end
