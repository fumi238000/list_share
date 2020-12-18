class ChecksController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    Check.create!(task_id: @task.id,user_id: current_user[:id])
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:task_id])
    Check.find_by(task_id: @task.id).destroy!
    redirect_to root_path
  
  end

end