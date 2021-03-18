class ParticipationsController < ApplicationController
  before_action :login_check
  before_action :set_participation, only: %i[destroy]
  # before_action :set_ransack, only: %i[new]
  # 登録しようとしているユーザーがログインユーザーではないか？
  # before_action :current_user?, only: %i[create]

  PER_PAGE = 3

  # OK
  def new
    @participation = Participation.new
    @category_id = params[:format]
  end

  # リファクタリングすること
  def show
    @participations = Participation.where(owner_id: current_user.id)

    # @participations = Participation.includes(owner_id: current_user.id)
    @category_id = params[:id]
  end

  def create
    # ログインユーザーの登録を阻止
    redirect_to participation_path(participation_params[:owner_id]), alert: 'ログインユーザーは登録できません'
    and return if participation_params[:user_id].to_i == current_user.id
    
    #同じユーザーの登録を阻止 
    binding.pry

    @participation = Participation.new(participation_params)
    
    if @participation.save
      redirect_to participation_path(@participation[:owner_id]), notice: '共有者を追加しました'
    else
      @category_id = participation_params[:category_id]
      render :new and return
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
    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end

  # def set_ransack
  #   @q = User.ransack(params[:q])
  #   @search_users = @q.result(distinct: true).limit(PER_PAGE)
  # end

  # def current_user?
  #   binding.pry
  #   if current_user[:id] == participation_params[:user_id].to_i
  #     render :new, alert: '自分自身は登録できません'
  #     # redirect_to new_participation_path, alert: '自分自身は登録できません'
  #   end
  # end


end
