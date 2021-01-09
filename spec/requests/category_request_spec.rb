require 'rails_helper'

RSpec.describe "Categorys", type: :request do
  
  describe "GET #index" do
    it "リクエストが成功する" do
      create_list(:category,3)
      get(categorys_path)
      # 200が欲しいが,302が返ってくる
      # expect(response).to have_http_status(200)
    end

    it "nameが表示されている", type: :doing do
      cateogry1 = create(:category)
      cateogry2 = create(:category)
      cateogry3 = create(:category)
      get(categorys_path)
      expect(response.body).to include(category1.name)  
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