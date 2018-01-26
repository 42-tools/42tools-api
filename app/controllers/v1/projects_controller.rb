class V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i(show)

  # GET /projects
  def index
    @projects = paginate(FortyTwo::Project.all)
  end

  # GET /projects/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = FortyTwo::Project.find(params[:id])
  end
end
