class V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i(show)

  # GET /projects
  def index
    @projects = Project.all

    paginate json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end
end
