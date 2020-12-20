class ParticipationsController < ApplicationController
  
  before_action :participation_params, only: %i[create]
  before_action :set_participation, only: %i[destroy]

  
  def index
    @participations = Participation.all
  end

  def new
    @participation = Participation.new
  end


  def create
    participation = Participation.create(
                    owner_id: current_user[:id], 
                    participation_id: participation_params[:participation_id],
                    category: participation_params[:category_id],
                    )

    if participation.save
      redirect_to participations_path, notice:"作成しました"
    else
      redirect_to new_participation_path, alert: "全て入力してください"
    end
  end



  def destroy
    @participation.destroy!
    redirect_to participations_path, alert: "削除しました"
  end


  def participation_params
    params.require(:participation).permit(:participation_id,:category_id)
  end

  def set_participation
    @participation = Participation.find(params[:id])
    # cuurent_userのみ消せないように後から設定する
    # redirect_to category_path, alert: "権限がありません"
  end


end
