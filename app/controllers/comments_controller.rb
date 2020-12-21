class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task, only: %i[index]
  before_action :set_task_id, only: %i[new edit]
  
  def new
    @comment = Comment.new 
    @task_id = params[:task_id].to_i
  end


  def create
    comment = Comment.create(task_id: comment_params[:task_id], user_id: current_user[:id],content: comment_params[:content])  
      
    if comment.save
      redirect_to task_path(comment_params[:task_id]), notice:"コメントを作成しました"
    else
      redirect_to new_comment_path, alert: "空投稿はできません。"
    end
  end



  def show
    comments = Comment.all  
    @comments = comments.where(user_id: current_user[:id])
  end

  def edit
    @task_id = params[:id]
  end

  def update
    @comment.update!(comment_params)
    redirect_to task_path(@comment.task_id), notice: "コメントを更新しました"
  end
 


  def destroy
    @comment.destroy!
    redirect_to task_path(@comment.task_id), alert: "コメントを削除しました"
  end



private

  def comment_params
    params.require(:comment).permit(:content,:task_id)
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end

end
