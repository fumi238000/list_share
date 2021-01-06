require 'rails_helper'

RSpec.describe "Users", type: :request do
  #show
  describe "GET #show" do
    subject { get(user_path(user_id))}
    context "ユーザーが存在する時" do
      let(:user) { create(:user)}
      let(:user_id) { user.id  }
      
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(:ok)
      end
      
      it "nameが表示されている" do
        subject
        expect(response.body).to include user.name
      end 

      it "emailが表示されている"  do
        subject
        expect(response.body).to include user.email
      end

      it "登録日が表示されている" do
        subject
        expect(response.body).to include user.created_at.to_s(:datetime_jp)
      end  

      # it "利用日数が表示されている", type: :doing do
      #   subject
      #   let(:continuerd_day) { }
      #   expect(response.body).to include user.Time.current
      # end  

      # it "imageが表示されている"  do
      # end
    end
  
    context ":idに対応するユーザーが存在しないとき" do
      let(:user_id) { 100 }
      it "エラーが発生する" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


  #create
  describe "GET #create" do
    subject { post(users_path, params: params) }
    context "パラメータが正常なとき" do
      let(:params) { { user: attributes_for(:user) } }

      it "リクエストが成功する", type: :doing  do
        subject
        expect(response).to have_http_status(302)
      end
      
      it "ユーザーが保存される" do
      end

      it "詳細ページにリダイレクトされる" do
      end
    end

    context "パラメータが異常なとき" do
      it "リクエストが成功する" do
      end
  
      it "ユーザーが保存されない" do
      end
  
      it "新規投稿ページがレンダリングされる" do
      end
    end    




  end




end
