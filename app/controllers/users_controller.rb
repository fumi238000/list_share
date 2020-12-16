class UsersController < ApplicationController
  before_action :set_image, only: %i[show]
  #マイページ
  def show
    @user = User.find(params[:id])
  end



  def set_image
    @post = Post.find(params[:id])
  end  
  
  def post_params
    params.require(:post).permit(:image)
  end


end
