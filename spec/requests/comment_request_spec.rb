require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe "GET #new" do
    subject { get(new_comment_path) }
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #create" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "コメントが保存される" do
      end

      it "task/showにリダイレクトされる" do
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "コメントが保存されない" do
      end

      it "新規登録にレンダリングされる" do
      end
    
    end

  end

  describe "GET #show" do
    context "コメントが存在する時" do 
      
      it "リクエストが成功する" do
      end

      it "コメントが表示されている" do
      end

    end
  end



  describe "GET #edit" do
    context "コメントが存在する時" do
      
      it "リクエストが成功する" do
      end

      it "contentが表示されている" do
      end
    
    end
  end

  
  
  describe "GET #update" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "コメントが保存される" do
      end

      it "task/showにリダイレクトされる" do
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "コメントが保存されない" do
      end

      it "task/showにレンダリングされる" do 
      end
    end
  end

  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "コメントが削除される" do
      end

      it "task/showリダイレクトすること" do
        # expect(response).to redirect_to(tasks_path)
      end
    end
  end


end