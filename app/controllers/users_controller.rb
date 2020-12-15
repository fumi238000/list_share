class UsersController < ApplicationController
  before_action :set_image, only: %i[show]
  #マイページ
  def show
    @user = User.find(params[:id])
  end


 

  def set_image
    @post = Post.all
    # @posts = @posts.select(user_id: current_user)
    # @post = Post.select(:image, :user_id)
    # @post = @post.where(user_id: current_user)
    # @post = Post.all
    # binding.pry
    # @post= @post.where(user_id: current_user)
  end  
  
  def post_params
    params.require(:post).permit(:image)
  end


end
