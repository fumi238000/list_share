require 'rails_helper'

RSpec.describe "Categorys", type: :request do
  
  describe "GET #index" do
    subject { get(categorys_path) }

    context "カテゴリーが存在する時" do
      it "リクエストが成功する" do
        create_list(:category,1)
        subject
        expect(response).to have_http_status(200)
      end
    
      it "nameが表示されている" do
        category1 = create(:category)
        category2 = create(:category)
        category3 = create(:category)
        get(categorys_path)
        expect(response.body).to include(category1.name)  
      end
    end
  end



  describe "GET #new" do
    subject { get(new_category_path) }
    it "リクエストが成功する" do
       subject
       expect(response).to have_http_status(200)
     end
  end



  describe "GET #create" do
    subject { post(categorys_path, params: params) }
    before do
      @user = create(:user)
    end
    
    context "パラメータが正常な時" do
      let(:params) { { category: attributes_for(:category) } }  
      
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end
      
      it "カテゴリーが保存される" do
        sign_in @user
        expect { subject }.to change { Category.count }.by(1)
      end
      
      it "category/indexにリダイレクトされる" do
        sign_in @user
        subject
        expect(response).to redirect_to categorys_path
      end
    end

    context "パラメータが異常な時" do
      let(:params) { { category: attributes_for(:category, :invalid) } }

      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end
    
      it "カテゴリーが保存されない" do 
        sign_in @user
        expect { subject }.not_to change(Category, :count)
      end

      it "new_category_pathにレンダリングされる" do
        sign_in @user
        subject
        expect(response).to redirect_to new_category_path
      end
    end
  end



  describe "GET #edit" do
    subject { get(edit_category_path(category_id)) }
    before do
      @user = create(:user)
    end
    
    context "カテゴリーが存在する時" do
      let(:category) { create(:category) }
      let(:category_id) { category.id }
    
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      it "name が表示されている" do
        subject
        expect(response.body).to include category.name
      end
    end

    context ":idに対応するユーザーが存在しないとき" do
      let(:category_id) { 1 }
      it "エラーが発生する" do
        expect{ subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

  end

  
  describe "GET #update" do
    subject { post(categorys_path, params: params) }
    before do
      @user = create(:user)
    end
    
    context "パラメータが正常な時" do
      let(:params) { { category: attributes_for(:category) } }  
      
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it "カテゴリーが保存される" do 
      end

      it "〇〇にリダイレクトされる" do
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "〇〇が保存されない" do
      end

      it "〇〇がレンダリングされる" do
      end    
    end
  end

  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "カテゴリーが削除される" do
      end

      it "〇〇リダイレクトすること" do
        # subject
        # expect(response).to redirect_to(users_path)
      end
    end
  end

  describe "GET #move" do
    it "リクエストが成功する" do
    end
  end


end