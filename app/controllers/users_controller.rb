class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  #マイページ
  def show
    #経過日数
    @today = Time.current
    @continued_day= (@today.to_date - @user.created_at.to_date).to_i

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


  def clean
    @user = current_user.id
    #participations
    @participation = Participation.all
    @owner = @participation.where(owner_id: @user)
    @owner.destroy_all
    #comment
    @comments = Comment.all
    @comment = @comments.where(user_id: @user)
    @comment.destroy_all
    #task
    @tasks = Task.all
    @tasks.each do |task|      
      if task.category.user_id == @user
        task.destroy
      end
    end
    #category
    @categorys = Category.all
    @category = @categorys.where(user_id: @user)
    @category.destroy_all
    #user
    @user = User.find(@user)
    @user.destroy

    redirect_to root_path,notice:"ユーザーを全て削除しました。またのご利用をお待ちしています"
  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  
  def user_params
    params.require(:user).permit(:image)
  end
  
end
