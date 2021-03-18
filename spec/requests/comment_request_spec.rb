require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before do
    @user = create(:user)
  end
  let(:comment) { create(:comment) }

  describe 'GET #new' do
    subject { get(new_comment_path) }

    context "未ログインユーザの場合" do
      it "リダイレクトする" do
        subject
        expect(response).to have_http_status(:found)
      end
    end

    context "ログインユーザの場合" do
      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #create' do
    subject { post(comments_path, params: comment_params) }
    let(:comment_params) { { comment: attributes_for(:comment) } }

    describe '未ログインユーザーの場合' do
      context "パラメータが正常な時" do
        it 'リダイレクトする' do
          subject
          expect(response).to have_http_status(:found)
        end
      end
    end

    describe 'ログインユーザーの場合' do
      context 'パラメータが正常な時' do
        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:ok)
        end
  

        # TODO : うまくいかない・・・
        xit 'コメントが保存される',type: :doing  do
          sign_in @user
          subject
          expect { subject }.to change { Comment.count }.by(1)
        end

        # TODO : うまくいかない・・・
        xit 'task/show にリダイレクトされる' do
          sign_in @user
          subject
          expect(response).to redirect_to Task.last
        end
      end
  
      context 'パラメータが異常な時' do
        let(:params) { { comment: attributes_for(:comment, :invalid) } }

        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:ok)
        end

        it 'コメントが保存されない' do
          sign_in @user
          expect { subject }.not_to change(Comment, :count)
        end
      end
    end
  end




  describe 'GET #edit' do
    subject { get(edit_comment_path(comment_id)) }
    let(:comment) { create(:comment) }
    let(:comment_id) { comment.id }
    
    describe '未ログインユーザーの場合' do
      context 'コメントが存在する時' do
        it 'リダイレクトする' do
          subject
          expect(response).to have_http_status(:found)
        end
      end
    end

    describe 'ログインユーザーの場合' do
      context 'コメントが存在する時' do
        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:ok)
        end
  
        xit 'contentが表示される' do
          subject
          expect(response.body).to include comment.content
        end
      end
    end
  end

  describe 'GET #update' do
    subject { patch(comment_path(comment.id), params: comment_params) }
    let(:comment) { create(:comment) }
    let(:comment_params) { { comment: attributes_for(:comment) } }

    describe '未ログインユーザーの場合' do
      context 'コメントが存在する時' do
        it 'リダイレクトする' do
          subject
          expect(response).to have_http_status(:found)
        end
      end
    end

    describe 'ログインユーザーの場合' do
      context 'パラメータが正常な時' do
        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:found)
        end
  
        it 'コメントが保存される' do
          sign_in @user
          origin_content = comment.content
          new_content = comment_params[:comment][:content]
          expect { subject }.to change { comment.reload.content }.from(origin_content).to(new_content)
        end
  
        xit 'task/showにリダイレクトされる' do
          sign_in @user
          subject
          expect(response.body).to redirect_to Task.last
        end
      end
  
      context 'パラメータが異常な時' do
        let(:params) { { comment: attributes_for(:comment, :invalid) } }
  
        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:found)
        end
  
        it 'コメントが保存されない' do
          sign_in @user
          expect { subject }.not_to change(comment.reload, :content)
        end
  
      end
    end
  end

  describe 'GET #destroy' do
    subject { delete(comment_path(comment.id)) }
    let!(:comment) { create(:comment) }

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:found)
      end

      it 'コメントが削除される' do
        sign_in @user
        expect { subject }.to change(Comment, :count).by(-1)
      end

      it 'task/showリダイレクトする' do
        sign_in @user
        subject
        expect(response).to redirect_to Task.last
      end
    end
  end
end
