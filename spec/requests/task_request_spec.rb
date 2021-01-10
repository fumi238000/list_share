require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET #index" do
    context "タスクが存在する時" do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "nameが表示されている" do
      end
    end
  end

  describe "GET #new" do
    subject { get(new_task_path) }
    it "リクエストが成功する" do
    end
  end

  describe "GET #create" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "タスクが保存される" do
      end

      it "task/indexにリダイレクトされる"
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "タスクが保存されない" do
      end

      it "新規登録にレンダリングされる" do 
      end
    
    end
  end

  describe "GET #show" do
    context "タスクが存在する時" do 
      it "リクエストが成功する" do
      end

      it "nameが表示されている" do
      end
    end
  end



  describe "GET #edit" do
    context "タスクが存在する時" do
      it "リクエストが成功する" do
      end

      it "name が表示されている" do
      end
    end
  end


  context ":idに対応するユーザーが存在しないとき" do
    it "エラーが発生する" do
    end
  end

  
  describe "GET #update" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "タスクが保存される" do
      end

      it "task/indexにリダイレクトされる" do
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "タスクが保存されない"
      end

      it "task/indexにレンダリングされる" do
    
    end
  end

  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "タスクが削除される" do
      end

      it "task/indexリダイレクトすること" do
        # expect(response).to redirect_to(tasks_path)
      end
    end
  end

  describe "GET #move" do
    it "リクエストが成功する" do
    end
  end


end