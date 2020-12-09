class CategorysController < ApplicationController
  


  def index
    @categorys = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.category.create!(category_params)
    
    if @category.save
      redirect_to categorys_path, notice:"作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
    
    
    
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
