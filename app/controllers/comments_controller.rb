class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  
  def index
    @comments = Comment.all
  end



  def new    
    @comment = Comment.new
  end



  def create  

    binding.pry

    comment = Comment.create!(task_id: 1, user_id: current_user[:id],content: comment_params[:content])  
      
      if comment.save
        redirect_to comments_path, notice:"作成しました"
      else
        flash.now[:alert] = "作成に失敗しました"
        render :new
      end
    end



  def update
  end



  def destroy
  end



private

def comment_params
  params.require(:comment).permit(:content)
end


  def set_comment
    @comment = Comment.find(params[:id])
  end

end
