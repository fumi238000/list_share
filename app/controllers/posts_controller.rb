class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  # def index
  #   @posts = Post.order(id: :asc)
  # end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(image: post_params[:image],user_id: current_user[:id])

    if post.save
      redirect_to user_path(current_user),notice:"作成しました"
    else 
      redirect_to user_path(current_user),alert:"すでに存在しています"
    end
  end

  # def show
  # end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to user_path(current_user), notice: "更新しました"
  end

  def destroy
    binding.pry
    @post.destroy!
    redirect_to user_path(current_user), alert: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image)
  end
end