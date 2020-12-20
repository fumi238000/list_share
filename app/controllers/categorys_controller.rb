class CategorysController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]


  def index
    @categorys = current_user.category.order(:id)
  end


  def new
    @category = Category.new
  end

  def create
    category = current_user.category.create!(category_params)
    if category.save
      redirect_to categorys_path, notice:"作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end


  def edit
  end


  def update
    if @category.update!(category_params)
      redirect_to categorys_path(current_user), notice: "更新しました"
    else
      redirect_to categorys_path(current_user), alert: "あなたには権限がありません"
    end
  end


  def destroy
    @category.destroy!
    redirect_to categorys_path(current_user), alert: "削除しました"
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    # カテゴリーに含まれるuser_idとログインユーザーが一致しているか？
    @category = Category.find(params[:id])

    if @category.user_id === current_user[:id]
      #一致
      @category = current_user.category.find(params[:id])
    
    else

      #不一致
      redirect_to categorys_path, alert: "権限がありません"
    end
  end


# def set_category
#   @category = current_user.category.find(params[:id])
# end

end
 