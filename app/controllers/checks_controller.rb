class ChecksController < ApplicationController

  def create
    Check.create!(task_id: params[:task_id],user_id:current_user[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Check.find_by(task_id: params[:task_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

end