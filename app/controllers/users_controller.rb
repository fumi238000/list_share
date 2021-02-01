class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  #マイページ
  def show
    #経過日数
    @today = Time.current
    @continued_day= (@today.to_date - @user.created_at.to_date).to_i
  end

  def edit
  end



  def update
    if @user.update!(user_params)
      redirect_to user_path(@user), notice: "画像を変更しました"
    else
      render :edit  
    end
  end



  def destroy
    @user.remove_image!
    @user.save
    redirect_to user_path(@user),alert:"イメージ画像を削除しました"
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
    @categories = Category.all
    @category = @categories.where(user_id: @user)
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
    # params.permit(:image)
  end
  
end
