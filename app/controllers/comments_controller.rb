class CommentsController < ApplicationController
  before_action :login_check
  before_action :set_comment, only: %i[edit update destroy]

  # テスト用
  # skip_before_action :login_check


  def new
    @comment = Comment.new 
    @task_id = params[:task_id]
  end


  def create 
    comment = Comment.create(task_id: comment_params[:task_id], user_id: current_user[:id],content: comment_params[:content])  
      
    if comment.save
      redirect_to task_path(comment_params[:task_id]), notice:"コメントを作成しました"
    else
      redirect_to new_comment_path, alert: "エラーが発生しました。再度入力してください。"
    end
  end


  def edit
  end


  def update
    binding.pry
    if @comment.update(comment_params)
      binding.pry
      redirect_to task_path(@comment.task_id), notice: "コメントを更新しました"
    else
      binding.pry
      redirect_to edit_comment_path, alert: "エラーが発生しました"
    end
  end
 

  def destroy
    @comment.destroy!
    redirect_to task_path(@comment.task_id), alert: "コメントを削除しました"
  end



private

  def comment_params
    binding.pry
    params.require(:comment).permit(:content,:task_id)
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end

end
