class ParticipationsController < ApplicationController
  def index
    @participations = Participation.all
  end
end
