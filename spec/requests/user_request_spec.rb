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


# edit
describe "GET #edit" do
  subject { get(edit_user_path(user_id)) }
  context "ユーザーが存在する時" do
    let(:user) { create(:user) }
    let(:user_id) { user.id }
    
    it "リクエストが成功する", type: :doing  do      
      binding.pry
     subject
     expect(response).to have_http_status(200)
    end
    
    it "〇〇が表示される" do      
    end

  end
  
  context ":idに対応するユーザーが存在しない時" do
    it "エラーが発生する" do      
    end

end


# update


# destroy 


# clean



  end




end
