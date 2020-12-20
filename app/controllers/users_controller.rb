class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  #マイページ
  def show
    @user = User.find(params[:id])
    @task = Task.find(params[:id])
  end


  def create
    user = User.create(image: user_params)

    if user.save
      redirect_to user_path(current_user),notice:"作成しました"
    else 
      redirect_to user_path(current_user),alert:"すでに存在しています"
    end
  end



  def edit
  end



  def update
    @user.update!(user_params)
    redirect_to user_path(current_user), notice: "画像を変更しました"
  end



  def destroy
    @user.remove_image!
    @user.save
    redirect_to user_path(current_user),alert:"イメージ画像を削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  
  def user_params
    params.require(:user).permit(:image)
  end
  
end
