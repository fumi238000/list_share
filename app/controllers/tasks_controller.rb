class TasksController < ApplicationController
  before_action :login_check
  before_action :current_user_create_category?, only: %i[index]
  before_action :task_params, only: %i[create]
  before_action :set_task, only: %i[show edit update destroy]

  # テスト用
  # skip_before_action :login_check
  # skip_before_action :current_user_create_category?, only: %i[index]


  def index
    @tasks = Task.order(position: :asc)
    @categories = current_user.categories.order(position: :asc)
    @checked_task_ids = current_user.check.pluck(:task_id)
  end



  def new
    @task = Task.new
    @category_id = params[:category_id]
  end


  def create
    @task = Task.new(name: task_params[:name], category_id: task_params[:category_id])
    if @task.save
      redirect_to tasks_path, notice:"【#{@task[:name]}】を作成しました"
    else
      @category_id = task_params[:category_id]
      render :new
    end 
  end

  
  def show
    # comments = Comment.order(id: :desc)
    # @comments = comments.where(user_id: current_user)
    @comments = Comment.order(id: :desc).where(user_id: current_user)
    @task_id = params[:id].to_i
    # ログインユーザーが登録したコメントが存在するかしないか？
  end


  
  def edit
    @category_id = @task.category_id
    @task_name = @task.name
  end


  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "【#{@task[:name]}】に変更しました"
    else
      @category_id = task_params[:category_id]
      render :edit
    end
  end


  def destroy
    @task.destroy!
    redirect_to tasks_path, alert: "【#{@task[:name]}】を削除しました"
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
      redirect_to categories_path, alert: "そのタスクは権限がありません"
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
