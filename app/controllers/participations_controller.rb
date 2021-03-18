class ParticipationsController < ApplicationController
  before_action :login_check
  before_action :set_participation, only: %i[destroy]
  before_action :present_participation_user?, only: %i[create]
  # before_action :set_ransack, only: %i[new]
  # 登録しようとしているユーザーがログインユーザーではないか？
  # before_action :current_user?, only: %i[create]

  PER_PAGE = 3

  # OK
  def new
    @participation = Participation.new
    @category_id = params[:format]
  end

  def show
    # TODO: N+１問題を解消すること
    @participations = Participation.where(owner_id: current_user.id)
    @category_id = params[:id]
  end

  def create
    present_participation_user?

    @participation = Participation.new(participation_params)
    if @participation.save
      redirect_to participation_path(@participation[:owner_id]), notice: '共有者を追加しました'
    else
      @category_id = participation_params[:category_id]
      render :new
      # @owner_id = current_user[:id]
      # @q = User.ransack(params[:q])
      # @search_users = @q.result(distinct: true).limit(PER_PAGE)
    end
  end

  def destroy
    @participation.destroy!
    redirect_to participation_path(@participation.category), alert: '削除しました'
  end

  private

  def participation_params
    params.require(:participation).permit(:owner_id, :user_id, :category_id).merge(owner_id: current_user.id)
  end

  def set_participation
    @participation = Participation.find(params[:id])
  end

  # def set_ransack
  #   @q = User.ransack(params[:q])
  #   @search_users = @q.result(distinct: true).limit(PER_PAGE)
  # end

  def present_participation_user?
    # ログインユーザーのチェック
    redirect_to participation_path(participation_params[:owner_id]), alert: 'ログインユーザーは登録できません' and return if participation_params[:user_id].to_i == current_user.id
    # 同じユーザーの登録を阻止 
    redirect_to participation_path(participation_params[:owner_id]), alert: 'すでに登録されたユーザーです' and return if Participation.exists?(user_id: participation_params[:user_id])
  end
end
