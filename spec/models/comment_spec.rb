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
    
  
    context "user_idが空の時", type: :doing do
      let(:comment) { build(:comment, user_id: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        binding.pry
        expect(comment.errors.messages[:user]).to include "を入力してください"
      end
    end

    context "task_idが空の時" do
      let(:comment) { build(:comment, user_id: "") }
        it "エラーが発生する" do
      #     expect(subject).to eq true
        end
      end
  

    context "contentが空の時" do
    #   let(:task) { build(:task, name: "") }
      it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(task.errors.messages[:name]).to include "を入力してください"
       end
     end    
     context "contentが100文字以上の場合" do
    #   let(:task) { build(:task, name: "a" * 35) }
       it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(task.errors.messages[:name]).to include "は30文字以内で入力してください"
       end
     end
    
  end
end
