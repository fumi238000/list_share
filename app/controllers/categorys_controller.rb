class CategorysController < ApplicationController
  before_action :login_check
  before_action :set_category, only: %i[edit update destroy]
  before_action :current_user_create_category?, only: %i[index]
  # テスト用
  skip_before_action :login_check
  # skip_before_action :set_category, only: %i[edit update destroy]
  skip_before_action :current_user_create_category?, only: %i[index]

  def index
     @categorys = Category.order(:position)
    #  @categorys = current_user.categorys.order(:position)
  end


  def new
    @category = Category.new
  end


  def create
    category = current_user.categorys.create(category_params)
    if category.save
      redirect_to categorys_path, notice:"作成しました" 
    else
      redirect_to new_category_path, alert: "エラーが発生しました。重複・空投稿の可能性はありませんか？"
    end
  end


  def edit
    binding.pry
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
    @category = Category.find(params[:id])
  end
  
  # カテゴリーに含まれるuser_idとログインユーザーが一致しているか
  def category_user?
    if @category.user_id === current_user[:id]
      @category = current_user.category.find(params[:id])
    else
      redirect_to categorys_path, alert: "権限がありません"
    end
  end


  def current_user_create_category?
    @category = Category.all
    @category = @category.where(user_id: current_user).present?

    if @category == false
      redirect_to new_category_path, notice: "カテゴリーを作成しましょう！"
    end  
  end

end