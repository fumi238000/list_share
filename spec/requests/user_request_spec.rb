require 'rails_helper'

RSpec.describe "Users", type: :request do
  #show
  describe "GET #show" do
    subject { get(user_path(user_id))}
    context "ユーザーが存在する時", type: :doing do
      let(:user) { create(:user)}
      let(:user_id) { user.id }
      
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(:ok)
      end
      
      it "nameが表示されている" do
      end
      
      it "imageが表示されている" do
      end

      it "emailが表示されている" do
      end

      it "登録日が表示されている" do
      end  

      it "利用日数が表示されている" do
      end  

    end
  end
end
