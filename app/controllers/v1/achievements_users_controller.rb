class V1::AchievementsUsersController < ApplicationController
  before_action :set_achievements_user, only: [:show]

  # GET /achievements_users
  # GET /achievements_users.json
  def index
    @titles = paginate(FortyTwo::AchievementUser.all)
  end

  # GET /achievements_users/1
  # GET /achievements_users/1.json
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_achievements_user
    @title = FortyTwo::AchievementUser.find(params[:id])
  end
end
