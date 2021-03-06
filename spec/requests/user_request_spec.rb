# rubocop:disable all
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # show
  describe 'GET #show' do
    subject { get(user_path(user_id)) }
    context 'ユーザーが存在する時' do
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'nameが表示されている' do
        subject
        expect(response.body).to include user.name
      end

      it 'emailが表示されている' do
        subject
        expect(response.body).to include user.email
      end

      it '登録日が表示されている' do
        subject
        expect(response.body).to include user.created_at.to_s(:datetime_jp)
      end

      # it "利用日数が表示されている" do
      #   subject
      #   let(:continuerd_day) { }
      #   expect(response.body).to include user.Time.current
      # end

      # it "imageが表示されている"  do
      # end
    end

    context ':idに対応するユーザーが存在しないとき' do
      let(:user_id) { 100 }
      it 'エラーが発生する' do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  # edit
  describe 'GET #edit' do
    subject { get(edit_user_path(user_id)) }
    context 'ユーザーが存在する時' do
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'imageが表示される' do
      end
    end

    context ':idに対応するユーザーが存在しない時' do
      let(:user_id) { 1000 }
      it 'エラーが発生する' do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  # update
  describe 'GET #update' do
    subject { patch(user_path(user.id), params: params) }
    let(:user) { create(:user) }

    context 'パラメータが正常な場合' do
      let(:params) { { user: attributes_for(:user) } }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'image が更新される' do
        # origin_name = user.name
        # new_name = params[:user][:name]
        # expect { subject }.to change { user.reload.name }.from(origin_name).to(new_name)
      end

      it '詳細ページにリダイレクトされる' do
        subject
        expect(response).to redirect_to User.last
      end
    end

    context 'user のパラメータが異常なとき' do
      let(:params) { { user: attributes_for(:user, :invalid) } }

      it 'リクエストが成功する' do
        #   subject
        #   expect(response).to have_http_status(200)
      end

      it 'image が更新されない' do
        expect { subject }.not_to change(user.reload, :image)
      end

      it '編集ページがレンダリングされる' do
        # subject
        # expect(response.body).to include '編集'
      end
    end
  end

  # destroy
  describe 'GET #destroy' do
    subject { delete(user_path(user.id)) }
    let!(:user) { create(:user) }

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'ユーザーが削除される' do
        # expect { subject }.to change(User, :count).by(-1)
      end

      it 'ユーザー一覧にリダイレクトすること' do
        subject
        expect(response).to redirect_to(user_path)
      end
    end
  end
end

# clean
# rubocop:enable all
