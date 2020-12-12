class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  
  def index
  end



  def new    
    @comment = Comment.new
  end



  def create
    #現状全てcategory[0]に作成されているので注意
    # select_category = current_user.category[0]
  
    #   task = select_category.task.create!(task_params)
    #   if task.save
    #     redirect_to tasks_path, notice:"作成しました"
    #   else
    #     flash.now[:alert] = "作成に失敗しました"
    #     render :new
      end
    end



  def update
  end



  def destroy
  end



private

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
