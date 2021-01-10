require 'rails_helper'

RSpec.describe "Categorys", type: :request do

  describe "GET #index" do

    subject { get(categorys_path) }
    context "ユーザーが存在する時" do
      before  {create_list(:category,3) }
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
    end

      it "nameが表示されている" do
        cateogry1 = create(:category)
        cateogry2 = create(:category)
        cateogry3 = create(:category)
        get(categorys_path)
        expect(response.body).to include(category1.name)  
      end
    end
  end

  describe "GET #new" do
    subject { get(new_category_path) }
    it "リクエストが成功する" do
    #   subjectgit b
    #   expect(response).to have_http_status(200)
     end
  end

  describe "GET #create" do
    context "パラメータが正常な時" do
      it "リクエストが成功する" do
      end

      it "カテゴリーが保存される"
      end

      it "〇〇にリダイレクトされる"
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "〇〇が保存されない"
      end

      it "〇〇がレンダリングされる"
    
    
    end



  describe "GET #edit" do
    context "カテゴリーが存在する時"
    it "リクエストが成功する" do
    end

    it "〇〇が表示されている" do
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

      it "カテゴリーが保存される"
      end

      it "〇〇にリダイレクトされる"
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "〇〇が保存されない"
      end

      it "〇〇がレンダリングされる"
    
    end
  end

  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "カテゴリーが削除される" do
      end

      it "〇〇リダイレクトすること" do
        subject
        expect(response).to redirect_to(users_path)
      end
    end
  end

  describe "GET #move" do
    it "リクエストが成功する" do
    end
  end


end