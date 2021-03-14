class CommentsController < ApplicationController
  before_action :login_check
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Comment.new
    @task_id = params[:task_id]
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to task_path(comment_params[:task_id]), notice: 'コメントを作成しました'
    else
      @task_id = comment_params[:task_id]
      render :new
    end
  end

  def edit
    @task_id = @comment.task.id
  end

  def update
    if @comment.update(comment_params)
      redirect_to task_path(@comment.task_id), notice: 'コメントを更新しました'
    else
      @task_id = comment_params[:task_id]
      render :edit
    end
  end

  def destroy
    @comment.destroy!
    redirect_to task_path(@comment.task_id), alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :task_id).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
