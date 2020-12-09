class CategorysController < ApplicationController
  


  def index
    @categorys = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = current_user.category.create!(category_params)
    redirect_to categorys_path, notice:"作成しました"
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
