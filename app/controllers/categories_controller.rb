class CategoriesController < ApplicationController
  before_action :login_check
  before_action :login_user_create_category?, only: %i[index edit update destroy]
  before_action :set_category, only: %i[edit update destroy move]
  # TODO: 共有関連のbefore_actionを追加する

  def index
    @categories = current_user.categories.order(:position)
    # TODO: 共有しているカテゴリーを表示
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
    @category_name = @category.name
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "カテゴリー名を【 #{@category[:name]} 】に変更しました"
    else
      @category_name = Category.find(params[:id]).name
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: "【#{@category[:name]}】を削除しました"
  end

  def move
    @category.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  # カテゴリーが一つもない場合、作成する
  def login_user_create_category?
    redirect_to new_category_path, notice: 'カテゴリーを作成しましょう！' if current_user.categories.blank?
  end
end
