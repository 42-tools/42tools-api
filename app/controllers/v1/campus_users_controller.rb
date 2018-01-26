class V1::CampusUsersController < ApplicationController
  before_action :set_campus_user, only: %i(show)

  # GET /campus_users
  def index
    @campus_users = paginate(FortyTwo::CampusUser.all)
  end

  # GET /campus_users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus_user
    @campus_user = FortyTwo::CampusUser.find(params[:id])
  end
end
