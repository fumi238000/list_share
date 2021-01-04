require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    subject {comment.valid?} 

    context "データが条件を満たす時" do
      let(:comment) { build(:comment) }
      it "保存ができる" do
        expect(subject).to eq true
      end
    end


    context "contentが100文字以下の場合" do
      let(:comment) { build(:comment, content: "a" * 51) }
       it "保存できる" do
        binding.pry
        expect(subject).to eq true
       end
     end


    context "user_idが空の時" do
      let(:comment) { build(:comment, user_id: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(comment.errors.messages[:user]).to include "を入力してください"
      end
    end

    context "task_idが空の時" do
      let(:comment) { build(:comment, task_id: "") }
        it "エラーが発生する" do
          expect(subject).to eq false
          expect(comment.errors.messages[:task]).to include "を入力してください"
        end
      end
  

    context "contentが空の時"  do
      let(:comment) { build(:comment, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include "を入力してください"
       end
     end    

     context "contentが100文字以上の場合" do
      let(:comment) { build(:comment, content: "a" * 101) }
       it "エラーが発生する" do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include "は100文字以内で入力してください"
       end
     end
  end
end
