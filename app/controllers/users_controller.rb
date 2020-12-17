class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  #マイページ
  def show
    @user = User.find(params[:id])
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
    redirect_to user_path(current_user), notice: "更新しました"
  end



  def destroy
    @user.destroy!
    redirect_to user_path(current_user), alert: "削除しました"
  end



  private

  def set_user
    @user = User.find(params[:id])
  end


  
  def user_params
    params.require(:user).permit(:image)
  end
  
end




#Postテーブルにログインユーザーのidがあるか
# def post_check
#   if Post.exists?(user_id: current_user)
#     #あればそのままどうぞ
#   else
#     #なければ、作成してください
#     Post.create(user_id: current_user[:id], image: "default.jpeg")  
#   end
# end