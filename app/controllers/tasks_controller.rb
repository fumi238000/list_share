class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  before_action :task_params, only: %i[create]

  def index

     @tasks = Task.all
     @categorys = current_user.category.order(:id)
     @checked_task_ids = current_user.check.pluck(:task_id)   
    end



  def new
    @task = Task.new
    @category_id = params[:category_id]
  end


  def create

    task = Task.create!(name: task_params[:name], category_id: task_params[:category_id])

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
    redirect_to root_path, notice: "更新しました"
  end



  def destroy
    @task.destroy!
    redirect_to root_path, alert: "削除しました"
  end





  def set_task
    @task = Task.find(params[:id])
    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end


  def task_params
    params.require(:task).permit(:name,:category_id)
  end
  
end
