# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :login_check
  # before_action :current_user_create_category?, only: %i[index]

  def index
    @categories = current_user.categories.order(:position)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create!(category_params)
    if @category.save
      redirect_to categories_path, notice: "【#{@category[:name]}】を作成しました"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    @category_name = @category.name
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "カテゴリー名【 #{@category[:name]} 】に変更しました"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, alert: "【#{@category[:name]}】を削除しました"
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
  # TODO: リファクタリング？
  def category_user?
    if @category.user_id == current_user[:id]
      @category = current_user.category.find(params[:id])
    else
      redirect_to categories_path, alert: '権限がありません'
    end
  end

  # TODO: リファクタリング？
  def current_user_create_category?
    @category = Category.all
    @category = @category.where(user_id: current_user).present?
    redirect_to new_category_path, notice: 'カテゴリーを作成しましょう！' if @category == false
  end
end
