class CategorysController < ApplicationController
  
  def index
    @categorys = Category.all
  end

  def new
    binding.pry
    
    @category = Category.new
  end

  def create
    binding.pry
    Category.create(category_params)
    # category = current_user.category.create!(category_params)
    # redirect_to category
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
