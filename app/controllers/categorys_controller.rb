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
    @category.updae!(category_params)
    redirect_to @category
  end


  def destroy
    @category.destroy!
    redirect_to root_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end


end
 