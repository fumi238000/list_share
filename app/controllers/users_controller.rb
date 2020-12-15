class UsersController < ApplicationController
  
  #マイページ
  def show
    @user = User.find(params[:id])
  end


 


end
