class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task, only: %i[index]

  def new
    @comment = Comment.new
  end


  def create
    comment = Comment.create!(task_id: comment_params[:task_id], user_id: current_user[:id],content: comment_params[:content])  
      
    if comment.save
      binding.pry
      redirect_to task_path(comment_params[:task_id]), notice:"作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end



  def show
    comments = Comment.all  
    @comments = comments.where(user_id: current_user[:id])
  end

  def edit
  end

  def update
    @comment.update!(comment_params)
    redirect_to root_path, notice: "更新しました"
  end
 


  def destroy
    @comment.destroy!
    redirect_to root_path, alert: "削除しました"
  end



private

  def comment_params
    params.require(:comment).permit(:content,:task_id)
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end



  def set_task
    # @comment = Comment.all  
    # @comments = @comment.where(user_id: current_user[:id])
  #   if @comment.user_id === current_user[:id]
  #     @category = current_user.category.find(params[:id])
  #   else
  #     redirect_to categorys_path, alert: "権限がありません"
  #   end

  end

end
