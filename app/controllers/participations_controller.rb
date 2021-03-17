class ParticipationsController < ApplicationController
  before_action :login_check
  # before_action :set_ransack, only: %i[new]
  before_action :participation_params, only: %i[create]
  before_action :current_user?, only: %i[create]
  before_action :set_participation, only: %i[destroy]

  PER_PAGE = 3

  # OK
  def new
    @participation = Participation.new
    @category_id = params[:format]
  end

  def show
    @participations = Participation.order(id: :asc)
    @participations = @participations.where(category_id: params[:id])
    @category_id = params[:id]
  end

  def create
    binding.pry
    @participation = Participation.new(participation_params)

    if @participation.save
      redirect_to participation_path(category_id), notice: '作成しました'
    else
      # @owner_id = current_user[:id]
      @category_id = participation_params[:category_id]
      # @q = User.ransack(params[:q])
      # @search_users = @q.result(distinct: true).limit(PER_PAGE)
      render :new
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

  def set_ransack
    @q = User.ransack(params[:q])
    @search_users = @q.result(distinct: true).limit(PER_PAGE)
  end

  def current_user?
    if current_user[:id] == participation_params[:user_id].to_i
      redirect_to new_participation_path, alert: '自分自身は登録できません'
    end
  end
end
