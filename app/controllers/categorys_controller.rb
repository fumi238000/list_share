class CategorysController < ApplicationController
  before_action :login_check
  before_action :set_category, only: %i[edit update destroy]
  before_action :current_user_create_category?, only: %i[index]
  # テスト用
  # skip_before_action :login_check
  # skip_before_action :current_user_create_category?, only: %i[index]

  def index
     @categorys = Category.order(:position)
  end


  def new
    @category = Category.new
  end


  def create
    @category = current_user.categorys.create(category_params)
    if @category.save
      redirect_to categorys_path, notice:"【#{@category[:name]}】を作成しました" 
    else
      # redirect_to new_category_path, alert: "#{@category.errors.full_messages}"
      # ここをrenderにすると、if文が作動するよ！ 書き方確認する　ダサいz
      render "new"
      # redirect_to new_category_path, alert: @category.errors.full_messages  
    end
  end


  def edit
  end


  def update
    if @category.update(category_params)
      redirect_to categorys_path, notice: "【#{@category[:name]}】に変更しました"
    else
      redirect_to edit_category_path, alert: @category.errors.full_messages
      # redirect_to edit_category_path, alert: "更新できませんでした"
    end
  end


  def destroy
    @category.destroy
    redirect_to categorys_path, alert: "【#{@category[:name]}】を削除しました"
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