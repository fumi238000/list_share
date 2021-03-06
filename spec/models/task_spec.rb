require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーション' do
    subject { task.valid? }

    context 'データが条件を満たす時' do
      let(:task) { build(:task) }
      it '保存ができる' do
        expect(subject).to eq true
      end
    end

    context 'category_idが30文字以下の場合' do
      let(:task) { build(:task, name: 'a' * 16) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end

    context 'nameが空の時' do
      let(:task) { build(:task, name: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(task.errors.messages[:name]).to include 'を入力してください'
      end
    end

    context 'category_idが空の時' do
      let(:task) { build(:task, category_id: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(task.errors.messages[:category_id]).to include 'を入力してください'
      end
    end

    context 'nameが30文字以上の場合' do
      let(:task) { build(:task, name: 'a' * 35) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(task.errors.messages[:name]).to include 'は30文字以内で入力してください'
      end
    end
  end
end

# describe "scope"  do
#   context "データを保存した時" do
#     subject { category.valid? }
#     let(:category) { build(:category) }

#       it "positionに番号は付与される" do
#       expect(category).to eq true
#      end
#   end
# end
