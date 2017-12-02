class V1::ProjectsUsersCursusController < ApplicationController
  before_action :set_projects_users_cursu, only: %i(show)

  # GET /projects_users_cursus
  def index
    @projects_users_cursus = ProjectsUsersCursus.all

    paginate json: @projects_users_cursus
  end

  # GET /projects_users_cursus/1
  def show
    render json: @projects_users_cursus
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_projects_users_cursu
    @projects_users_cursus = ProjectsUsersCursus.find(params[:id])
  end
end
