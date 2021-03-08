require 'rails_helper'

RSpec.describe 'Categorys', type: :request do
  before do
    @user = create(:user)
    # @categories = create(:category, user_id: @user.id)
  end

  describe 'GET #index' do
    subject { get(categories_path) }
    # let(:category) { create(:category, user_id: @user.id) }
    
      context '未ログインユーザー（カテゴリーが存在する）時' do
        before do
          @categories = create(:category, user_id: @user.id)
        end

        it 'リダイレクトする',type: :doing do
          subject
          expect(response).to have_http_status(:found)
        end
      end

      context '未ログインユーザー（カテゴリーが存在しない）時' do
        it 'リダイレクトする',type: :doing do
          subject
          expect(response).to have_http_status(:found)
        end
      end
      
      context 'ログインユーザー（カテゴリーが存在する）' do
        before do
          @categories = create(:category, user_id: @user.id)
        end

        it 'リクエストが成功する' do
          sign_in @user
          subject
          expect(response).to have_http_status(:ok)
        end

        xit 'nameが表示されている' do
          category1 = create(:category)
          category2 = create(:category)
          category3 = create(:category)
          get(categories_path)
          expect(response.body).to include(category1.name)
        end
      end

      context 'ログインユーザー（カテゴリーが存在しない）' do
        before do
          @categories = create(:category)
        end

        it 'リダイレクトする' do
          sign_in @user
          subject
          expect(response).to have_http_status(:found)
        end

        xit 'カテゴリー新規作成画面に遷移する' do
        end

      end
    end


# ------------------------------------------------------------------現在


#   describe 'GET #new' do
#     subject { get(new_category_path) }
#     it 'リクエストが成功する' do
#       subject
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'GET #create' do
#     subject { post(categories_path, params: params) }
#     before do
#       @user = create(:user)
#     end

#     context 'パラメータが正常な時' do
#       let(:params) { { category: attributes_for(:category) } }

#       it 'リクエストが成功する' do
#         sign_in @user
#         subject
#         expect(response).to have_http_status(302)
#       end

#       it 'カテゴリーが保存される' do
#         sign_in @user
#         expect { subject }.to change { Category.count }.by(1)
#       end

#       it 'category/indexにリダイレクトされる' do
#         sign_in @user
#         subject
#         expect(response).to redirect_to categories_path
#       end
#     end

#     context 'パラメータが異常な時' do
#       let(:params) { { category: attributes_for(:category, :invalid) } }

#       it 'リクエストが成功する' do
#         sign_in @user
#         subject
#         expect(response).to have_http_status(302)
#       end

#       it 'カテゴリーが保存されない' do
#         sign_in @user
#         expect { subject }.not_to change(Category, :count)
#       end

#       it 'new_category_pathにレンダリングされる' do
#         sign_in @user
#         subject
#         expect(response).to redirect_to new_category_path
#       end
#     end
#   end

#   describe 'GET #edit' do
#     subject { get(edit_category_path(category_id)) }
#     before do
#       @user = create(:user)
#     end

#     context 'カテゴリーが存在する時' do
#       let(:category) { create(:category) }
#       let(:category_id) { category.id }

#       it 'リクエストが成功する' do
#         sign_in @user
#         subject
#         expect(response).to have_http_status(200)
#       end

#       it 'name が表示されている' do
#         subject
#         expect(response.body).to include category.name
#       end
#     end

#     context ':idに対応するユーザーが存在しないとき' do
#       let(:category_id) { 1 }
#       it 'エラーが発生する' do
#         expect { subject }.to raise_error ActiveRecord::RecordNotFound
#       end
#     end
#   end

#   describe 'GET #update' do
#     subject { patch(category_path(category.id), params: params) }
#     let(:category) { create(:category) }
#     before do
#       @user = create(:user)
#     end

#     context 'パラメータが正常な時' do
#       let(:params) { { category: attributes_for(:category) } }

#       it 'リクエストが成功する' do
#         sign_in @user
#         subject
#         expect(response).to have_http_status(302)
#       end

#       it 'カテゴリーが更新される' do
#         origin_name = category.name
#         new_name = params[:category][:name]
#         expect { subject }.to change { category.reload.name }.from(origin_name).to(new_name)
#       end

#       it 'categories_path にリダイレクトされる' do
#         subject
#         expect(response).to redirect_to categories_path
#       end
#     end

#     context 'パラメータが異常な時' do
#       let(:params) { { category: attributes_for(:category, :invalid) } }
#       it 'リクエストが成功する' do
#         sign_in @user
#         subject
#         expect(response).to have_http_status(302)
#       end

#       it 'name が保存されない' do
#         expect { subject }.not_to change(category.reload, :name)
#       end

#       it 'edit_category_path にレンダリングされる' do
#         subject
#         expect(response.body).to redirect_to edit_category_path
#       end
#     end
#   end

#   describe 'GET #destroy' do
#     subject { delete(category_path(category.id)) }
#     let!(:category) { create(:category) }

#     context 'パラメータが正常な場合' do
#       it 'リクエストが成功する' do
#         subject
#         expect(response).to have_http_status(302)
#       end

#       it 'カテゴリーが削除される' do
#         expect { subject }.to change(Category, :count).by(-1)
#       end

#       it 'categories_path にリダイレクトすること' do
#         subject
#         expect(response).to redirect_to categories_path
#       end
#     end
#   end

#   describe 'GET #move' do
#     it 'リクエストが成功する' do
#     end
#   end
end
