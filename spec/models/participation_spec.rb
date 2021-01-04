require 'rails_helper'

RSpec.describe Participation, type: :model do
  describe "バリデーション" do
    subject { participation.valid?}

    context "データが条件を満たす時" do
      let(:participation) { build(:participation) }
      it "保存できる" do
      expect(subject).to eq true
      end
    end

    # context "participation_idがintegerの時" do
    #   it "保存できる" do
    #   end
    # end

    context "owner_idが空の時" do
      let(:participation) { build(:participation, owner_id: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(participation.errors.messages[:owner_id]).to include "を入力してください"
      end
    end

    context "participation_idが空の時" do
      let(:participation) { build(:participation, participation_id: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(participation.errors.messages[:participation_id]).to include "を入力してください"
      end
    end

    context "categoryが空の時" do
      let(:participation) { build(:participation, category: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(participation.errors.messages[:category]).to include "を入力してください"
      end
    end

    # context "owner_idが存在しないUserの場合" do
    #   it "エラーが発生する" do
    #   end
    # end

    # context "participation_idが存在しないUserの場合" do
    #   it "エラーが発生する" do
    #   end
    # end

    # context "participation_idがinteger以外の時" do
    #   it "エラーが発生する" do
    #   end
    # end


  end
end
