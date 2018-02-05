class V1::AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show]

  # GET /achievements
  # GET /achievements.json
  def index
    @titles = paginate(FortyTwo::Achievement.all)
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_achievement
    @title = FortyTwo::Achievement.find(params[:id])
  end
end
