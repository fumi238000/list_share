class TasksController < ApplicationController
  before_action :login_check
  before_action :current_user_create_category?, only: %i[index]
  before_action :task_params, only: %i[create]
  before_action :set_task, only: %i[show edit update destroy]

  # テスト用
  skip_before_action :login_check
  skip_before_action :current_user_create_category?, only: %i[index]






  def index
    @tasks = Task.order(position: :asc)
    @categorys = current_user.categorys.order(:id)
    @checked_task_ids = current_user.check.pluck(:task_id)
  end



  def new
    @task = Task.new
    @category_id = params[:category_id]
  end


  def create
    task = Task.new(name: task_params[:name], category_id: task_params[:category_id])
    if task.save
      redirect_to tasks_path, notice:"作成しました"
    else      
      redirect_to new_task_path, alert: "エラーが発生しました。重複・空投稿の可能性はありませんか？"
    end 
  end

  
  def show
    comments = Comment.order(id: :desc)
    @comments = comments.where(user_id: current_user[:id])
  end

  
  def edit
    binding.pry
    @category_id = @task.id
  end


  def update 
    binding.pry
    if @task.update(task_params)
      redirect_to tasks_path, notice: "更新しました"
    else
      redirect_to edit_task_path, alert: "更新に失敗しました"
    end
  end


  def destroy
    @task.destroy!
    redirect_to tasks_path, alert: "削除しました"
  end

  def move
    @task = Task.find(params[:id])
    @task.insert_at(params[:position].to_i)
    head :ok
  end

private

  def set_task
    @task = Task.find(params[:id])

  end

  def include_category
    @category = Category.find(@task.category_id) 
    
    if @category.user_id == current_user[:id] 
    else
      redirect_to categorys_path, alert: "そのタスクは権限がありません"
    end
    
    @task = Task.find(params[:id])
    
    end



  def task_params
    params.require(:task).permit(:name,:category_id)
  end



  #カテゴリー作成判定メソッド
  def current_user_create_category?
    @category = Category.all
    @category = @category.where(user_id: current_user).present?

    if @category == false
      redirect_to new_category_path, notice: "カテゴリーを作成しましょう！"
    end  
  end

end
