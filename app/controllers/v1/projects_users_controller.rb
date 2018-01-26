class V1::ProjectsUsersController < ApplicationController
  before_action :set_projects_user, only: %i(show)

  # GET /projects_users
  def index
    @projects_users = paginate(FortyTwo::ProjectsUser.all)
  end

  # GET /projects_users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_projects_user
    @projects_user = FortyTwo::ProjectsUser.find(params[:id])
  end
end
