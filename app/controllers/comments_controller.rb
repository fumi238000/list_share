class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  
  def index
    @comments = Comment.all
  end



  def new
    @comment = Comment.new
  end



  def create

    # task_idの引数の渡し方を変える
    comment = Comment.create!(task_id: 1, user_id: current_user[:id],content: comment_params[:content])  
      
    if comment.save
      redirect_to comments_path, notice:"作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end



  def edit
  end

  def update
  end



  def destroy
    @comment.destroy!
    redirect_to comments_path
  end



private

def comment_params
  params.require(:comment).permit(:content)
end


  def set_comment
    @comment = Comment.find(params[:id])
  end

end
