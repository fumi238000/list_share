require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  before do
    @user = create(:user)
  end

  describe "GET #new" do
    subject { get(new_participation_path, params: {format: 1} ) }

    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end


  describe "GET #show" do
    subject { get(participation_path(participation_id)) }
    
    context "参加者が存在する時" do
      let(:participation) { create(:participation) }
      let(:participation_id) { participation.id }

      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      # 保留
      it "参加者が表示されている" do
        # subject
        # binding.pry
        # expect(response.body).to include participation.user_id
      end
    end
  end


  describe "GET #create" do
    subject { post(participations_path, params: params ) }
    before do 
      category =  create(:category) 
    end

    context "パラメータが正常な時" do
      let(:params) { {  participation: attributes_for(:participation) } }
      
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it "参加者が保存される" do
        sign_in @user
        expect { subject }.to change { Participation.count }.by(1)
      end

      it "participation/showにリダイレクトされる" do
        sign_in @user
        subject
        expect(response).to redirect_to("/participations/1")
      end
    end


    context "パラメータが異常な時" do
      let(:params) { {  participation: attributes_for(:participation, :invalid) } }
      it "リクエストが成功する"do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end
    
      it "参加者が保存されない" do
        sign_in @user
        expect { subject }.not_to change(Participation, :count)
      end

      it "new_participation_pathにレンダリングされる" do
        sign_in @user
        subject
        expect(response).to redirect_to ("/participations/new.1")
      end  
    end



 end


  # describe "GET #destroy" do
  #   context "パラメータが正常な場合" do
  #     it "リクエストが成功する" do
  #     end

  #     it "参加者が削除される" do
  #     end

  #     it "participation/showリダイレクトすること" do
  #     end
  #   end
  # end

end