require 'rails_helper'

RSpec.describe "Categorys", type: :request do

  describe "GET #index" do

    subject { get(categorys_path) }
    context "ユーザーが存在する時" do
      before  {create_list(:category,3) }
      it "リクエストが成功する"  , type: :doing do
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
    it "リクエストが成功する" do
    end
  end

  describe "GET #create" do
    it "リクエストが成功する" do
    end
  end

  describe "GET #edit" do
    it "リクエストが成功する" do
    end
  end

  describe "GET #update" do
    it "リクエストが成功する" do
    end
  end

  describe "GET #destroy" do
    it "リクエストが成功する" do
    end
  end

  describe "GET #move" do
    it "リクエストが成功する" do
    end
  end


end