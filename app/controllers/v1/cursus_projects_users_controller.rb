class V1::CursusProjectsUsersController < ApplicationController
  before_action :set_cursus_projects_user, only: %i(show)

  # GET /cursus_projects_users
  def index
    @cursus_projects_users = paginate(FortyTwo::CursusProjectsUsers.all)
  end

  # GET /cursus_projects_users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_cursus_projects_user
    @cursus_projects_user = FortyTwo::CursusProjectsUsers.find(params[:id])
  end
end
