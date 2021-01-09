class ParticipationsController < ApplicationController
  before_action :login_check
  before_action :participation_params, only: %i[create]
  before_action :set_participation, only: %i[destroy]
  before_action :set_ransack, only: %i[new]


  PER_PAGE = 3

  def new
    @participation = Participation.new
    @category = params[:category]
  end


  def show
    @participations = Participation.all
    @participations = @participations.where(category: params[:id])
    @participation = params[:id]
  end


  def create
    if current_user[:id] == participation_params[:participation_id].to_i
      redirect_to new_participation_path ,alert: "自分自身は登録できません"
    else

      participation = Participation.create(
                      owner_id: current_user[:id], 
                      participation_id: participation_params[:participation_id],
                      category: participation_params[:category_id],
                      )
      if participation.save
        redirect_to participation_path(participation_params[:category_id]), notice:"作成しました"
      else
        redirect_to new_participation_path, alert: "入力に誤りがあります。すでに登録されている可能性もあります。"
      end
    end
  end


  def destroy
    @participation.destroy!
    redirect_to participation_path(@participation.category), alert: "削除しました"
  end


  def participation_params
    params.require(:participation).permit(:participation_id,:category_id)
  end


  def set_participation
    @participation = Participation.find(params[:id])
    


    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end

  def set_ransack
    @q = User.ransack(params[:q])
    @search_users= @q.result(distinct: true).limit(PER_PAGE)
  end

end
