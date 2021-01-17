require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user = create(:user)
  end

  describe "GET #new" do
    subject { get(new_comment_path) }
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #create" do
    subject { post(comments_path, params: params) }
    before do
      task =  create(:task) 
    end

    context "パラメータが正常な時" do
      let(:params) { { comment: attributes_for(:comment) } }
     
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it "コメントが保存される"  do
        sign_in @user
        expect { subject }.to change { Comment.count }.by(1)
      end

      it "task/show にリダイレクトされる" do
        sign_in @user
        subject
        expect(response).to redirect_to Task.last
      end
    end

    context "パラメータが異常な時" do
      let(:params) { { comment: attributes_for(:comment, :invalid) } }

      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end
    
      it "コメントが保存されない" do
        sign_in @user
        expect { subject }.not_to change(Comment, :count)
      end

      it "new_comment_pathにレンダリングされる" do
        sign_in @user
        subject
        expect(response).to redirect_to new_comment_path
      end
    end
  end


# テンプレートが存在しないため、現在パス
  # describe "GET #show" do
  #   subject { get(comment_path(comment_id)) }
    
  #   context "コメントが存在する時" do 
  #     let(:comment) { create(:comment) }
  #     let(:comment_id) { comment.id }
      
  #     it "リクエストが成功する", type: :doing do
  #       sign_in @user
  #       binding.pry
  #       subject
  #       binding.pry
  #       expect(response).to have_http_status(200)
  #     end

  #     it "commentが表示されている" do
  #     end

  #   end
  # end



  describe "GET #edit" do
    subject { get(edit_comment_path(comment_id)) }
    context "コメントが存在する時" do
      let(:comment) { create(:comment) }
      let(:comment_id) { comment.id }
      
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      it "contentが表示される" do
        subject
        expect(response.body).to include comment.content
      end
    end
  end

  
  
  describe "GET #update" do
  subject { patch(comment_path(comment.id), params: params) }
  let(:comment) { create(:comment)}
    
    context "パラメータが正常な時" do
      let(:params) { { comment: attributes_for(:comment) } }

      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it "コメントが保存される" do
        sign_in @user
        origin_content = comment.content
        new_content = params[:comment][:content]
        expect { subject }.to change { comment.reload.content }.from(origin_content).to(new_content)
      end

      it "task/showにリダイレクトされる", type: :doing  do
        subject
        expect(response.body).to redirect_to Task.last
      end
    end

    context "パラメータが異常な時" do
      it "リクエストが成功する" do
      end
    
      it "コメントが保存されない" do
      end

      it "task/showにレンダリングされる" do 
      end
    end
  end

  describe "GET #destroy" do
    context "パラメータが正常な場合" do
      it "リクエストが成功する" do
      end

      it "コメントが削除される" do
      end

      it "task/showリダイレクトすること" do
        # expect(response).to redirect_to(tasks_path)
      end
    end
  end


end