class UsersController < ApplicationController
  before_action :post_check, only: %i[show]
  IMAGE = "default.jpeg"

  #マイページ
  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])

  end


  
  def post_params
    params.require(:post).permit(:image)
  end



  #Postテーブルにログインユーザーのidがあるか
  def post_check
    if Post.exists?(user_id: current_user)
      #あればそのままどうぞ
    else
      #なければ、作成してください
      Post.create(user_id: current_user[:id], image: "default.jpeg")  
    end
  end

end
