class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  
  def index
    @tasks = Task.all

    # @tasks = category.Task.all
    # @tasks = current_user.category.order(:id)
    # @categorys = current_user.category.order(:id)
  end



  def new
    @task = Task.new
  end



  def create
    #現状全てcategory[0]に作成されているので注意
    select_category = current_user.category[0]

    task = select_category.task.create!(task_params)
    if task.save
      redirect_to tasks_path, notice:"作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end



  def edit
  end



  def update
    @task.update!(task_params)
    redirect_to root_path
  end



  def destroy
    @task.destroy!
    redirect_to root_path
  end


  private

  def set_task
    @task = Task.find(params[:id])
    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end



  def task_params
    params.require(:task).permit(:name)
  end



end
