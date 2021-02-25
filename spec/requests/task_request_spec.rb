# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  before do
    @user = create(:user)
  end

  describe 'GET #index' do
    subject { get(tasks_path) }

    context 'タスクが存在する時' do
      it 'リクエストが成功する' do
        create_list(:task, 1)
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      it 'nameが表示されている' ,type: :doing  do
        sign_in @user
        binding.pry
        task1 = create(:task)
        task2 = create(:task)
        task3 = create(:task)
        get(tasks_path)
        expect(response.body).to include(task1.name)
      end
    end
  end

  describe 'GET #new' do
    subject { get(new_task_path) }
    it 'リクエストが成功する' do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #create' do
    subject { post(tasks_path, params: params) }
    before do
      category = create(:category)
    end

    context 'パラメータが正常な時' do
      let(:params) { { task: attributes_for(:task) } }

      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it 'タスクが保存される' do
        sign_in @user
        expect { subject }.to change { Task.count }.by(1)
      end

      it 'task/indexにリダイレクトされる' do
        sign_in @user
        subject
        expect(response).to redirect_to tasks_path
      end
    end

    context 'パラメータが異常な時' do
      let(:params) { { task: attributes_for(:task, :invalid) } }

      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it 'タスクが保存されない' do
        sign_in @user
        expect { subject }.not_to change(Task, :count)
      end

      it 'new_task_pathにレンダリングされる' do
        sign_in @user
        subject
        expect(response).to redirect_to new_task_path
      end
    end
  end

  describe 'GET #show' do
    subject { get(task_path(task_id)) }
    before do
      comment = create(:comment)
    end

    context 'タスクが存在する時' do
      let(:task) { create(:task) }
      let(:task_id) { task.id }

      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      it 'nameが表示されている' do
        subject
        expect(response.body).to include task.name
      end
    end
  end

  describe 'GET #edit' do
    subject { get(edit_task_path(task_id)) }

    context 'タスクが存在する時' do
      let(:task) { create(:task) }
      let(:task_id) { task.id }

      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end

      it 'name が表示されている' do
        subject
        expect(response.body).to include task.name
      end
    end

    context ':idに対応するユーザーが存在しないとき' do
      let(:task_id) { 1 }
      it 'エラーが発生する' do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'GET #update' do
    subject { patch(task_path(task.id), params: params) }
    let(:task) { create(:task) }
    before do
      @user = create(:user)
    end

    context 'パラメータが正常な時' do
      let(:params) { { task: attributes_for(:task) } }

      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it 'タスクが保存される' do
        origin_name = task.name
        new_name = params[:task][:name]
        expect { subject }.to change { task.reload.name }.from(origin_name).to(new_name)
      end

      it 'tasks_pathにリダイレクトされる' do
        subject
        expect(response.body).to redirect_to tasks_path
      end
    end

    context 'パラメータが異常な時' do
      let(:params) { { task: attributes_for(:task, :invalid) } }
      it 'リクエストが成功する' do
        sign_in @user
        subject
        expect(response).to have_http_status(302)
      end

      it 'タスクが保存されない' do
        expect { subject }.not_to change(task.reload, :name)
      end

      it 'edit_task_pathにレンダリングされる' do
        subject
        expect(response.body).to redirect_to edit_task_path
      end
    end
  end

  describe 'GET #destroy' do
    subject { delete(task_path(task.id)) }
    let!(:task) { create(:task) }

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'タスクが削除される' do
        expect { subject }.to change(Task, :count).by(-1)
      end

      it 'task/indexにリダイレクトする' do
        subject
        expect(response).to redirect_to tasks_path
      end
    end
  end

  describe 'GET #move' do
    it 'リクエストが成功する' do
    end
  end
end
