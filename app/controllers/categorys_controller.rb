class CategorysController < ApplicationController
  before_action :login_check
  before_action :set_category, only: %i[edit update destroy]
  # before_action :set_user, only: %i[index]

  def index
     @categorys = @current_user.category.order(:position)
  end


  def new
    @category = Category.new
  end


  def create
    category = current_user.category.create(category_params)
    if category.save
      redirect_to categorys_path, notice:"作成しました"
    else
      redirect_to new_category_path, alert: "空投稿はできません。"
    end
  end


  def edit
  end


  def update
    @category.update!(category_params)
    redirect_to categorys_path, notice: "更新しました"
  end


  def destroy
    @category.destroy
    redirect_to categorys_path, alert: "削除しました"
  end

  def move
    @category = Category.find(params[:id])
    @category.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


  def set_category
    # カテゴリーに含まれるuser_idとログインユーザーが一致しているか
    @category = Category.find(params[:id])

    if @category.user_id === current_user[:id]
      @category = current_user.category.find(params[:id])
    else
      redirect_to categorys_path, alert: "権限がありません"
    end
  end

  # def set_user
  #   user = User.find(params[:id])
  # end

end