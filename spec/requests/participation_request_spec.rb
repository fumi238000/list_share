require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET #new" do
    subject { get(new_participation_path) }
    it "リクエストが成功する" do
    #   subjectgit b
    #   expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    context "参加者が存在する時" do 
      it "リクエストが成功する" do
      end

      it "参加者が表示されている" do
      end
    end
  end


  describe "GET #create" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "参加者が保存される" do
      end

      it "participation/showにリダイレクトされる" do
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "参加者が保存されない" do
      end

      it "新規登録にレンダリングされる" do
      end
    
    end
  end


  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "参加者が削除される" do
      end

      it "participation/showリダイレクトすること" do
      end
    end
  end

end