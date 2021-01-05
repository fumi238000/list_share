require 'rails_helper'

RSpec.describe "Users", type: :request do
  #show
  describe "GET #show" do
    subject { get(user_path(user_id))}
    context "ユーザーが存在する時" do
      let(:user) { create(:user)}
      let(:user_id) { user.id }
      
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

      it "利用日数が表示されている" do
        subject
        binding.pry
        expect(response.body).to include user.image
      end  

    end
  end


  it "imageが表示されている"  do
  end
end
